const test = require('node:test');
const assert = require('node:assert/strict');
const { isDuplicate } = require('../tools/duplicates');

test('returns true when page titles are the same', () => {
  assert.equal(isDuplicate({ title: 'Home' }, { title: 'Home' }), true);
});

test('returns false when page titles are different', () => {
  assert.equal(isDuplicate({ title: 'Home' }, { title: 'About' }), false);
});

test('returns false when a page is missing', () => {
  assert.equal(isDuplicate(null, { title: 'Home' }), false);
});
