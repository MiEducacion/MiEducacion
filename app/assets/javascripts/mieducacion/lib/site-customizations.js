import chroma from 'chroma-js'
import essentialsPreload from '../pre-initializers/essentials-preload'

let SiteSettings = essentialsPreload.preloadedData.SiteSettings

var colors = {
    primary: SiteSettings.primary_color,
    secondary: SiteSettings.secondary_color
}

function generateColorVariations(hexColor, name) {
    const color = chroma(hexColor)
    const variations = {}
  
    for (let i = 1; i <= 9; i++) {
      variations[`-${i}00`] = color
        .brighten(i)
        .hex()
    }
  
    Object.entries(variations).forEach(color => {
      const [key, value] = color;
      document.getElementById("mieducacion").style.setProperty(`--m-${name}${key}`, value);
    });   
    
    return variations
  }
  



Object.entries(colors).forEach(color => {
    const [colorName, value] = color;
    generateColorVariations(value, colorName);
    document.getElementById("mieducacion").style.setProperty(`--m-${colorName}`, value);
  });
  
