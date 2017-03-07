let isOpen = false;
let isMobileSearchOpen = false;

function openNav() {
    if (!isOpen) {
	document.getElementById("my-side-nav").style.width = "250px";
	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	document.body.style.transition = "background-color 0.5s";
	setTimeout(function() { isOpen = true; }, 500);
    }
}

function closeNav() {
    if (isOpen) {
	document.getElementById("my-side-nav").style.width = "0";
	document.body.style.backgroundColor = "white";
	isOpen = false;
    }
}

function showMobileSearchbar() {
    if (!isMobileSearchOpen) {
	let mobileSearch = document.getElementById("mobile-search");
	let mobileSearchBar = document.getElementById("mobile-search-bar");
	document.getElementById("brand").style.display = "none";
	document.getElementById("mobile-close-search").style.display = "initial";
	mobileSearch.style.display = "initial";
	mobileSearchBar.style.width = "130px";
	setTimeout(function() { isMobileSearchOpen = true; }, 500);
    }
}

function closeMobileSearchBar() {
    if (isMobileSearchOpen) {
	let mobileSearch = document.getElementById("mobile-search");
	let mobileSearchBar = document.getElementById("mobile-search-bar");
	document.getElementById("mobile-close-search").style.display = "none";
	document.getElementById("brand").style.display = "initial";
	mobileSearch.style.display = "none";
	mobileSearchBar.style.width = "0";
	setTimeout(function() { isMobileSearchOpen = false; }, 500);
    }
}

$(document).ready(function() {
    $('#side-nav-button').on('click touchstart', function() {
	openNav();
    });

    $('#mobile-search-icon').on('click touchstart', function() {
	showMobileSearchbar();
    });

    $('#mobile-close-search').on('click touchstart', function() {
	closeMobileSearchBar();
    });
    
    $(document).on('click touchend', function(e) {
	if (e.target != $('#my-side-nav')[0]) {
	    closeNav();
	}
    });
});
