import chroma from 'chroma-js'
import { BODY_ELEMENT } from '../helpers/dom-helper'
import { SiteSettings } from '../pre-initializers/essentials-preload'

var colors = {
  primary: SiteSettings.primary_color,
  secondary: SiteSettings.secondary_color
}

const generateColorVariations = (hexColor, name) => {
  const color = chroma(hexColor)
  const variations = {}

  for (let i = 1; i <= 9; i++) {
    variations[`-${i}00`] = color
      .brighten(i / 2.5)
      .hex()
  }

  Object.entries(variations).forEach(color => {
    const [key, value] = color;
    BODY_ELEMENT.style.setProperty(`--m-${name}${key}`, value);
  });

  return variations
}




Object.entries(colors).forEach(color => {
  const [colorName, value] = color;
  generateColorVariations(value, colorName);
  BODY_ELEMENT.style.setProperty(`--m-${colorName}`, value);
});

