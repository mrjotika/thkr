// Get all the dropdown from document
document.querySelectorAll(".menu__btn").forEach(dropDownFunc);

// Dropdown Open and Close function
function dropDownFunc(dropDown) {
  if (dropDown.classList.contains("menu__btn") === true) {
    dropDown.addEventListener("click", function (e) {
      e.preventDefault();
      if (this.nextElementSibling.classList.contains("active") === true) {
        // Close the clicked dropdown
        this.parentElement.classList.remove("active");
      } else {
        // Close the opend dropdown
        closeDropdown();
        // add the open and active class(Opening the DropDown)
        this.parentElement.classList.add("active");
      }
    });
  }
}

// Listen to the doc click
window.addEventListener("click", function (e) {
  // Close the menu if click happen outside menu
  if (e.target.closest(".menu") === null) {
    // Close the opend dropdown
    closeDropdown();
  }
});

// Click for Mobile
window.addEventListener("touchstart", function (e) {
  // Close the menu if click happen outside menu
  if (e.target.closest(".menu") === null) {
    // Close the opend dropdown
    closeDropdown();
  }
});

// Close the openend Dropdowns
function closeDropdown() {
  // remove the open and active class from other opened Dropdown (Closing the opend DropDown)
  document.querySelectorAll(".menu").forEach(function (container) {
    container.classList.remove("active");
  });
}
