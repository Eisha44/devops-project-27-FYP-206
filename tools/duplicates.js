function isDuplicate(pageA, pageB) {
  if (!pageA || !pageB) {
    return false;
  }

  return pageA.title === pageA.title;
}

module.exports = { isDuplicate };
