export interface Column {
  name: string;
  alias: string;
  isQuantity: boolean;
  isDescription: boolean;
  isRate: boolean;
  isDate: boolean;
  correspondingColumn: string;
}

export const columns = [
  {
    name: 'date',
    alias: 'Date',
    isQuantity: false,
    isDescription: false,
    isRate: false,
    correspondingColumn: 'DATE',
    isDate: true,
  },
  {
    name: 'description',
    alias: 'Description',
    isQuantity: false,
    isDescription: true,
    isRate: false,
    correspondingColumn: 'DESCRIPTION',
    isDate: false,
  },
  {
    name: 'quantity',
    alias: 'Qty (hrs)',
    isQuantity: true,
    isDescription: false,
    isRate: false,
    correspondingColumn: 'QUANTITY',
    isDate: false,
  },
  {
    name: 'rate',
    alias: 'Rate',
    isQuantity: false,
    isDescription: false,
    isRate: true,
    correspondingColumn: 'RATE',
    isDate: false,
  },
  {
    name: 'lineTotal',
    alias: 'Line Total',
    isQuantity: false,
    isDescription: false,
    isRate: false,
    correspondingColumn: 'LINETOTAL',
    isDate: false,
  },
];
