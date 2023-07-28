const navButton = document.querySelector(".menu-icon");
const primaryNav = document.querySelector(".burger-menu");

navButton.addEventListener('click', () => {
    const isOpened = navButton.getAttribute('aria-expanded');
    if(isOpened === "false"){
        navButton.setAttribute('aria-expanded', 'true');
    }
    else{
        navButton.setAttribute('aria-expanded', 'false');
    }
    primaryNav.toggleAttribute("data-visible");
    primaryNav.classList.remove("hide-on-start");
});