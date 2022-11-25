import fs from 'fs';
import { Colours } from '../colours';

export interface Line {
  date: string;
  project: string;
  quantity: string;
  description: string;
  rate: string;
  lineTotal: string;
}

const DATE_COL_INDEX = 0;
const PROJECT_COL_INDEX = 1;
const QUANTITY_COL_INDEX = 2;
const DESCRIPTION_COL_INDEX = 3;
const RATE_COL_INDEX = 4;
const TOTAL_COL_INDEX = 5;

export const generateLines = (): { lines: Line[]; invoiceTotal: number } => {
  if (!fs.existsSync('./data/data.tsv')) {
    console.log(Colours.Red, 'Please include the "data.tsv" file at /data/data.tsv');
    return;
  }
  const file = fs.readFileSync('./data/data.tsv');
  const linesRaw = file.toString().trim().replace(/£/gm, '').split('\r\n');
  let invoiceTotal = 0;
  const lines = linesRaw.map((line) => {
    const cols = line.split('\t').map((s) => s.trim());
    const lineTotal = parseFloat(cols[TOTAL_COL_INDEX]);
    const rate = parseFloat(cols[RATE_COL_INDEX]);
    invoiceTotal += lineTotal;
    return {
      date: cols[DATE_COL_INDEX],
      project: cols[PROJECT_COL_INDEX],
      quantity: cols[QUANTITY_COL_INDEX],
      description: cols[DESCRIPTION_COL_INDEX],
      rate: `£${rate.toFixed(2)}`,
      lineTotal: `£${lineTotal.toFixed(2)}`,
    };
  });
  return { lines, invoiceTotal };
};
