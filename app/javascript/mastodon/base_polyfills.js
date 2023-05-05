import 'intl';
import 'intl/locale-data/jsonp/en';
import 'es6-symbol/implement';
import assign from 'object-assign';
import values from 'object.values';
import promiseFinally from 'promise.prototype.finally';

if (!Object.assign) {
  Object.assign = assign;
}

if (!Object.values) {
  values.shim();
}

promiseFinally.shim();
