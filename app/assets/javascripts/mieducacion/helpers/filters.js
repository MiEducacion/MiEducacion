let globalFilters = { 
  truncate(value, size, phraseEnd = '') {
    if (!value) return '';
    value = value.toString();
  
    if (value.length <= size) {
      return value;
    }
    return value.substr(0, size) + phraseEnd;
  }
}

export default globalFilters