# dPeriods (Power Query M)

## Ready-to-use PBIX Download
[dcalendar-v6.0.pbix](https://github.com/alisonpezzott/dcalendar-powerquery/releases/tag/v6.0)

This version already includes the [dCalendar](https://github.com/alisonpezzott/dcalendar-powerquery) table.

## Using the code in Power Query + Tabular Editor Script
1. Complete the steps below only after you have finished the process for [dCalendar](https://github.com/alisonpezzott/dcalendar-powerquery);
2. Copy the code from [dperiods.pq](dperiods.pq);
3. In Power Query, create a new blank query;
4. Open the advanced editor and paste the code;
5. Adjust the settings in the steps;
6. Rename the query to dPeriods;
7. Close and apply;
8. Click on the `External Tools` menu;
9. Open the [Tabular Editor](https://www.sqlbi.com/tools/tabular-editor), which should already be installed;
10. Go to `File > Preferences > Features` and enable `Allow unsupported Power BI features`, then click `OK`;
11. Copy the code from [dperiods-tabular-editor.cs](dperiodos-tabular-editor.cs), paste it into the `C# Script` window, and click `Run` or press `F5`;
12. Then go to `File > Save` or press `Ctrl+S`;
13. Done! Go back to Power BI, and your dPeriods table will be complete, sorted, and organized.

## Using the code in Power Query + Manual Sorting
1. Complete the steps below only after you have finished the process for [dCalendar](https://github.com/alisonpezzott/dcalendar-powerquery);
2. Copy the code from [dperiods.pq](dperiods.pq);
3. In Power Query, create a new blank query;
4. Open the advanced editor and paste the code;
5. Adjust the settings in the steps;
6. Rename the query to dPeriods;
7. Close and apply;
8. Based on the file [dperiods-sorting.xlsx](dperiods-sorting.xlsx), manually sort the columns;
9. Relate the columns dCalendar[Date] with dPeriods[Date] with many-to-many cardinality, but with a single direction where dPeriods filters dCalendar.
