import moment from 'moment'

let globalFilters = { 
  truncate(value, size, phraseEnd = '') {
    if (!value) return '';
    value = value.toString();
  
    if (value.length <= size) {
      return value;
    }
    return value.substr(0, size) + phraseEnd;
  },
  timeAgo(date) {
    return moment(date).fromNow()
  }
}

export default globalFilters