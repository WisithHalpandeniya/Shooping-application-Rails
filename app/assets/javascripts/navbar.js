
$(document).ready(function() {
  var openNav = document.getElementById('openNav');
  var closeNav = document.getElementById('closeNav');
  
    openNav.addEventListener('click', function() {
      document.getElementById("mySidenav").style.width = "250px";
      document.getElementById("main").style.marginLeft = "250px";
      document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    })
  
    closeNav.addEventListener('click', function() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft= "0";
      document.body.style.backgroundColor = "white";
    })

    
    $('.list').click( function() {
      setTimeout(function(){window.location.reload()}, 500);
    })
});
