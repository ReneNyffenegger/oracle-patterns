[ex_01](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_01) loads fixed width data.

[ex_02](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_02) loads values seperated by `,`.

[ex_03](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_03) loads records whose `field_2` is equal `'Fruit'`.

[ex_04](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_04) loads two different tables from one data-file in one go.

[ex_05](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_05) demonstrates `date "yyyy.mm.dd"` to indicate the *date format*.

[ex_06](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_06) specifies `char (4000)` for a field whose data to be loaded is longer than 255 characters in order to prevent **Error Field in data file exceeds maximum length**. Actually, it's [load_6_ok.ctl](https://raw.githubusercontent.com/ReneNyffenegger/oracle-patterns/master/SQLLoader/ex_06/load_6_ok.ctl) that specifies it, not [load_6.ctl](https://raw.githubusercontent.com/ReneNyffenegger/oracle-patterns/master/SQLLoader/ex_06/load_6.ctl)

[ex_07](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_07) The ctl-file maps a position in the `*.dat` file to a field name in the loaded table.

[ex_08](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_08) Loads a *CSV File*. Since the [file to be loaded](https://github.com/ReneNyffenegger/oracle-patterns/blob/master/SQLLoader/ex_08/load_8.csv)
contains columns with commas (that are correctly set between apostrophes), the [control file](https://raw.githubusercontent.com/ReneNyffenegger/oracle-patterns/master/SQLLoader/ex_08/load_8.ctl)
contains the directive `optionally enclosed by '"'`. Also, the csv file has a header that must not be imported. Therefore, the control file also specifies `options(skip=1)`.

[ex_09](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_09) An example that loads dates. When these dates are empty, it inserts `sysdate` instead.

[ex_10](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_10) Demonstrating the `boundfiller` keyword in a *.ctl* file.

[ex_11](https://github.com/ReneNyffenegger/oracle-patterns/tree/master/SQLLoader/ex_11) Demonstrating the effect of the `trailing nullcols` option.
