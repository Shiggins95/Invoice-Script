import path from 'path';
import ftl from 'node-ftl';
import pdf from 'html-pdf';
import { Line } from './lines';
import { Column } from './columns';
import { formatDate } from './format';

export interface FTLData {
  lines: Line[];
  columns: Column[];
  transactionDate: string;
  transactionNumber: string;
  invoiceTotal: string;
}

const options = { format: 'Letter' };

export const generateFtl = async (data: FTLData) => {
  const fileName = `Cofficient-INV-${formatDate(new Date(), 'DD-MM-YYYY')}.pdf`;
  return new Promise((resolve, reject) => {
    ftl
      .processTemplate({
        data: { data },
        settings: {
          encoding: 'utf-8',
          viewFolder: path.join(__dirname, '../Templates/'),
        },
        filename: 'invoice.ftl',
      })
      .on('end', (err, html) => {
        pdf.create(html, options).toFile(`./output/${fileName}`, (error) => {
          if (error) return reject(error);
          if (html.substring(0, 19) !== '<?INVOICETEMPLATE?>') return reject('Error');
          return resolve(fileName);
        });
      });
  });
};
