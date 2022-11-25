import fs from 'fs';
import { padString } from './format';

const PREFIX = 'INVSH-';

export const getInvoiceNumber = (): string => {
  const jsonString = fs.readFileSync('./invoice-numbers.json');
  const json = JSON.parse(jsonString.toString());
  const current = json.current + 1;
  json.current = current;
  fs.writeFileSync('./invoice-numbers.json', JSON.stringify(json, undefined, 2));
  return `${PREFIX}${padString(current.toString(), '0', 3)}`;
};
