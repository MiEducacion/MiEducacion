import isEmpty from 'lodash/isEmpty';
import forEach from 'lodash/forEach';
let _ = {}

_.isEmpty = isEmpty
_.forEach = forEach

window._ = _

export default _