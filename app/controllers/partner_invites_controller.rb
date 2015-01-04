class PartnerInvitesController < ApplicationController
  before_action :require_auth, :require_registry
  before_action :set_partner_invite, only: [:destroy]

  # POST /partner_invites
  def create
    @partner_invite = PartnerInvite.new(partner_invite_params)

    # Registry ID of the invite will always be the current user's registry ID
    @partner_invite.registry_id = current_user.registry_id

    if @partner_invite.save
      @partner_invite.send_invite_email
      redirect_to @partner_invite.registry, notice: 'Project was successfully created.'
    else
      render 'registries/edit'
    end
  end

  # DELETE /partner_invites/1
  def destroy
    registry_id = @partner_invite.registry_id
    @partner_invite.invalidate
    redirect_to registry_path(registry_id), notice: 'Invitation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_invite
      @partner_invite = PartnerInvite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def partner_invite_params
      params.require(:partner_invite).permit(:first_name, :last_name, :email)
    end

end