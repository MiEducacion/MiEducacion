const html = document.querySelector("html");
export const isTouch = navigator.maxTouchPoints > 1 || "ontouchstart" in window;

if (isTouch) {
  html.classList.add("touch");
} else {
  html.classList.add("no-touch");
}