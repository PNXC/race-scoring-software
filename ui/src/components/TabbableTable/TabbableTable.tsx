import { Setter } from "../../common";

import './TabbableTable.css';

type TabbableTableState<T extends Record<string, string | boolean>> = T[];
type TabbableTableProps<T extends Record<string, string | boolean>> = {
    rows: TabbableTableState<T>,
    setRows: Setter<TabbableTableState<T>>,
    columns: {
        title: string,
        key: keyof T,
        readonly?: boolean,
    }[];
}
function TabbableTable<T extends Record<string, string | boolean>>({ rows, setRows, columns }: TabbableTableProps<T>) {
    return (
        <table>
            <thead>
                {columns.map((c, idx) => (
                    <th key={idx}>{c.title}</th>
                ))}
            </thead>
            <tbody>
                {rows.map((row, idx) => (
                    <tr key={idx} className="no-hover">
                        {columns.map((col, colIdx) => (
                            <td key={colIdx} className="cell">
                                {typeof row[col.key] === 'string' && (
                                    <input
                                        className="cell"
                                        value={row[col.key] as string}
                                        onChange={e => {
                                            setRows(rows => {
                                                const next = [...rows];
                                                next[idx]![col.key] = e.target.value as T[keyof T];
                                                return next;
                                            })
                                        }}
                                        disabled={col.readonly}
                                    />
                                )}
                                {typeof row[col.key] === 'boolean' && (
                                    <input
                                        className="cell"
                                        type="checkbox"
                                        checked={row[col.key] as boolean}
                                        onChange={e => {
                                            setRows(rows => {
                                                const next = [...rows];
                                                next[idx]![col.key] = e.target.checked as T[keyof T];
                                                return next;
                                            })
                                        }}
                                        disabled={col.readonly}
                                    />
                                )}
                            </td>
                        ))}
                    </tr>
                ))}
            </tbody>
        </table>
    )
};

export default TabbableTable;
