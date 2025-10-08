export type SetterArg<T> = T | ((current: T) => T);
export type Setter<T> = (arg: SetterArg<T>) => void;
