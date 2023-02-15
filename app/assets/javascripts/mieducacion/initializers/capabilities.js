const html = document.querySelector("html");
const touch = navigator.maxTouchPoints > 1 || "ontouchstart" in window;

if (touch) {
  html.classList.add("touch");
} else {
  html.classList.add("no-touch");
}