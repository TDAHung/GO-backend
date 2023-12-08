// const appShopItems = document.querySelectorAll(".app__shop__item");

// appShopItems.forEach(element => {
//     const button = element.querySelector(".app__shop__item__button");
//     button.addEventListener("click", () => {
//         const imageCheck = document.createElement("div");
//         imageCheck.classList.add("app__shop__item__button__cover");
//         const buttonCover = document.createElement("div");
//         buttonCover.classList.add("app__shop__item__button__check__cover");
//         imageCheck.appendChild(buttonCover);
//         button.removeChild(button.querySelector("p"));
//         button.classList.add("app__inactive");
//         button.appendChild(imageCheck);
//     });
// });

const formQuantity = document.querySelectorAll(".form_quantity");

formQuantity.forEach(element => {
    const button = element.querySelector(".button__action");
    button.addEventListener('click', () => {
        element.submit();
    })
})
