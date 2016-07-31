$(".c-icon--media-grey").mouseenter(function(){
  $(this).css("display", "none")
  $(this).next().css("display", "inline-block");
})
$(".c-icon--media-hidden").mouseleave( function(){
  $(this).css("display", "none")
  $(this).prev().css("display", "inline-block");
})

$(".c-icon--media-bar-grey").mouseenter(function(){
  $(this).css("display", "none")
  $(this).next().css("display", "inline-block");
})
$(".c-icon--media-bar-purple").mouseleave( function(){
  $(this).css("display", "none")
  $(this).prev().css("display", "inline-block");
})