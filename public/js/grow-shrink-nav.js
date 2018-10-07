/*
Grow and shrink the site logo at the 100px top breakpoint
Chris A. White | fyrebear.com
*/

window.onscroll = function() {
  growShrinkLogo()
};
function growShrinkLogo() {
  var Logo = document.getElementById("Logo")
  if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    Logo.style.width = '40px';
  } else {
    Logo.style.width = '80px';
  }
}