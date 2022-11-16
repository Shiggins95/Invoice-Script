import fs from 'fs';
import { columns } from './src/columns';
import { generateLines } from './src/lines';
import { FTLData, generateFtl } from './src/pdf';
import { Colours } from './colours';
import { getInvoiceNumber } from './src/transaction-data';
import { formatDate } from './src/format';

/**
 * transactionNumber
 * transactionDate
 * columns[{alias = should match up with the corresponding value in lines}]
 * lines[{date, description, qty, rate, lineTotal}]
 * invoiceTotal
 */

(async () => {
  console.log(Colours.Cyan, 'Generating data\n');
  const transactionNumber = getInvoiceNumber();
  const transactionDate = formatDate(new Date(), 'DD/MM/YYYY');
  const { lines, invoiceTotal } = generateLines();
  console.log(Colours.Cyan, 'Generating PDF file \n');
  const data: FTLData = {
    lines,
    columns,
    transactionDate,
    transactionNumber,
    invoiceTotal: `£${invoiceTotal.toFixed(2)}`,
  };
  await generateFtl(data);
  console.log(Colours.Green, 'Successfully generated PDF');
})();
