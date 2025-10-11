import React, { useCallback, useEffect, useMemo, useState } from "react";
import { IoChevronUpCircle, IoChevronDownCircle  } from "react-icons/io5";
import cx from 'classnames';

import './SortableTable.css';

// TODO: these types are a bit messed up. Sortable should only be possible if dataSource is provided
// TODO: this component only works in cases where all data is already loaded into memory
/// What if we want a paged endpoint?
// TODO: custom display fn (ex. for time, we want to sort on total seconds but display as mm:ss)

type ColumnData<V> = { dataSource: keyof V, content?: never } | { content: (v: V) => React.ReactNode, dataSource?: never };
type Column<V> = {
    title: string;
    sortable?: boolean;
} & ColumnData<V>;
interface SortableTableProps<V extends Record<string, any>> {
    columns: Column<V>[];
    data: V[];
    defaultSortedColumn: keyof V;
    rowLink?: ((row: V) => string) | undefined;
}
function SortableTable<V extends Record<string, any>>({
    columns,
    data,
    defaultSortedColumn,
    rowLink = undefined,
}: SortableTableProps<V>) {
    const [sortedColumn, setSortedColumn] = useState<keyof V>(defaultSortedColumn);
    const [sortAsc, setSortAsc] = useState<boolean>(false);
    const [sortedData, setSortedData] = useState<V[]>(data);

    const onSortClick = useCallback((column: keyof V) => {
        if (sortedColumn === column) {
            setSortAsc(v => !v);
        } else {
            setSortAsc(false);
            setSortedColumn(column);
        }
    }, [sortedColumn]);

    const SortChevron = useMemo(() => ({ column }: { column: keyof V }) => {
        return (
            <span className="chevron">
                &nbsp;
                {sortAsc ? <IoChevronUpCircle /> : <IoChevronDownCircle />}
            </span>
        );
    }, [sortAsc]);

    useEffect(() => {
        const sorted = [...data].sort((a, b) => {
            const va = a[sortedColumn];
            const vb = b[sortedColumn];

            if (typeof va === 'number' && typeof vb === 'number') {
                return va - vb;
            }

            const stra = String(va).toLowerCase();
            const strb = String(vb).toLowerCase();
            if (!sortAsc) {
                if (stra < strb) return -1;
                if (stra > strb) return 1;
            } else {
                if (stra < strb) return 1;
                if (stra > strb) return -1;
            }
            return 0;
        });
        setSortedData(sorted);
    }, [sortAsc, sortedColumn, data]);

    return (
        <table>
            <thead>
                <tr>
                    {columns.map((c, idx) => (
                        <th
                            key={idx}
                            onClick={() => {
                                if (c.dataSource && c.sortable) {
                                    onSortClick(c.dataSource);
                                }
                            }}
                            className={cx({ sortable: c.dataSource && c.sortable })}
                        >
                            {c.title}
                            {c.dataSource === sortedColumn && c.sortable && (
                                <SortChevron column={c.dataSource} />
                            )}
                        </th>
                    ))}
                </tr>
            </thead>
            <tbody>
                {sortedData.map((row, idx) => (
                    <tr key={idx}>
                        {columns.map((col, idx) => (
                            <td key={idx}>
                                <a className="full-row-link" href={rowLink?.(row)}>
                                    {col.dataSource ? row[col.dataSource] : col.content?.(row)}
                                </a>
                            </td>
                        ))}
                    </tr>
                ))}
            </tbody>
        </table>
    );
}

export default SortableTable;
