export const padString = (s: string, padWith: string, finalLength: number): string => {
  if (s.length >= finalLength) {
    return s;
  }
  let newString = s;
  do {
    newString = `${padWith}${newString}`;
  } while (newString.length < finalLength);
  return newString;
};

export const formatDate = (date: Date, format: string) => {
  const day = date.getDate().toString();
  const month = (date.getMonth() + 1).toString();
  const year = date.getFullYear().toString();
  return format
    .toUpperCase()
    .replace('DD', padString(day, '0', 2))
    .replace('MM', padString(month, '0', 2))
    .replace('YYYY', year);
};
