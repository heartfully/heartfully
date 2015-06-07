class AddAttachmentTestImgToRegistries < ActiveRecord::Migration
  def self.up
    change_table :registries do |t|
      t.attachment :banner_image
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :registries, :banner_image
    remove_attachment :registries, :profile_image
  end
end
