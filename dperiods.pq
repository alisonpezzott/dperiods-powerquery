let
    // Generate a table
    periods = #table (

        // Declaration of columns and types
        type table [
            Period = text,
            PeriodOrdinal = Int64.Type,
            PeriodGroup = text,
            PeriodGroupOrdinal = Int64.Type,
            Date = list
        ],

        // Buffer the dCalendar table
        let dCalendar = Table.Buffer ( dCalendar ) in

        // List of lists of values for each field
        {

        // Entire period
            { "Entire period",         1, "Entire period",  1, dCalendar[Date]                                                                                },        

        // Day
            { "Today",                 2, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] =     0                       )[Date]          },
            { "Yesterday",             3, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] =    -1                       )[Date]          },   
            { "Day before yesterday",  4, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] =    -2                       )[Date]          },
            { "Last 7 days",           5, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >=   -6 and [DateOffset] <= 0 )[Date]          },
            { "Last 15 days",          6, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >=  -14 and [DateOffset] <= 0 )[Date]          },
            { "Last 30 days",          7, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >=  -29 and [DateOffset] <= 0 )[Date]          },
            { "Last 60 days",          8, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >=  -59 and [DateOffset] <= 0 )[Date]          },
            { "Last 90 days",          9, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >=  -89 and [DateOffset] <= 0 )[Date]          },
            { "Last 180 days",        10, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >= -179 and [DateOffset] <= 0 )[Date]          },
            { "Last 365 days",        11, "Day",            2, Table.SelectRows ( dCalendar, each [DateOffset] >= -364 and [DateOffset] <= 0 )[Date]          },

        // Week
            { "This week",            12, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] =    0  )[Date]                              },
            { "Last week",            13, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] =   -1  )[Date]                              },
            { "Week before last",     14, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] =   -2  )[Date]                              },
            { "Last 3 weeks",         15, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] >=  -2 and [WeekOffset] <= 0 )[Date]       },
            { "Last 6 weeks",         16, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] >=  -5 and [WeekOffset] <= 0 )[Date]       },
            { "Last 9 weeks",         17, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] >=  -8 and [WeekOffset] <= 0 )[Date]       },
            { "Last 12 weeks",        18, "Week",           3, Table.SelectRows ( dCalendar, each [WeekOffset] >= -11 and [WeekOffset] <= 0 )[Date]       },

        // Fortnight
            { "This fortnight",       19, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] =    0 )[Date]                               },
            { "Last fortnight",       20, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] =   -1 )[Date]                               },
            { "Fortnight before last",21, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] =   -2 )[Date]                               },
            { "Last 3 fortnights",    22, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] >=  -2 and [FortnightOffset] <= 0 )[Date]     },
            { "Last 6 fortnights",    23, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] >=  -5 and [FortnightOffset] <= 0 )[Date]     },
            { "Last 9 fortnights",    24, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] >=  -8 and [FortnightOffset] <= 0 )[Date]     },
            { "Last 12 fortnights",   25, "Fortnight",      5, Table.SelectRows ( dCalendar, each [FortnightOffset] >= -11 and [FortnightOffset] <= 0 )[Date]     },

        // Month
            { "This month",           26, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] =    0 )[Date]                                  },
            { "Last month",           27, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] =   -1 )[Date]                                  },
            { "Month before last",    28, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] =   -2 )[Date]                                  },
            { "Last 3 months",        29, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] >=  -2 and [MonthOffset] <= 0 )[Date]             },
            { "Last 6 months",        30, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] >=  -5 and [MonthOffset] <= 0 )[Date]             },
            { "Last 9 months",        31, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] >=  -8 and [MonthOffset] <= 0 )[Date]             },
            { "Last 12 months",       32, "Month",          4, Table.SelectRows ( dCalendar, each [MonthOffset] >= -11 and [MonthOffset] <= 0 )[Date]             },

        // Quarter
            { "This quarter",         33, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] =    0 )[Date]                            },
            { "Last quarter",         34, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] =   -1 )[Date]                            },
            { "Quarter before last",  35, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] =   -2 )[Date]                            },
            { "Last 3 quarters",      36, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] >=  -2 and [QuarterOffset] <= 0 )[Date] },
            { "Last 6 quarters",      37, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] >=  -5 and [QuarterOffset] <= 0 )[Date] },
            { "Last 9 quarters",      38, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] >=  -8 and [QuarterOffset] <= 0 )[Date] },
            { "Last 12 quarters",     39, "Quarter",        5, Table.SelectRows ( dCalendar, each [QuarterOffset] >= -11 and [QuarterOffset] <= 0 )[Date] },
            
        // Year    
            { "This year",            40, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] =    0 )[Date]                                  },
            { "Last year",            41, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] =   -1 )[Date]                                  },
            { "Year before last",     42, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] =   -2 )[Date]                                  },
            { "Last 2 years",         43, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] >=  -2 and [YearOffset] <= 0 )[Date]             },
            { "Last 3 years",         44, "Year",            6, Table.SelectRows ( dCalendar, each [YearOffset] >=  -5 and [YearOffset] <= 0 )[Date]             },
            { "Last 4 years",         45, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] >=  -8 and [YearOffset] <= 0 )[Date]             },
            { "Last 5 years",         46, "Year",           6, Table.SelectRows ( dCalendar, each [YearOffset] >= -11 and [YearOffset] <= 0 )[Date]             },

        // Up to             
            { "Up to today",          47, "Up to",           7, Table.SelectRows ( dCalendar, each [DateOffset] <= 0 )[Date]                                   },
            { "Up to yesterday",      48, "Up to",           7, Table.SelectRows ( dCalendar, each [DateOffset] <= -1 )[Date]                                  },
            { "Up to day before yesterday", 49, "Up to",     7, Table.SelectRows ( dCalendar, each [DateOffset] <= -2 )[Date]                                  }
        }
    ),

    // Expand the Date list column
    expandedPeriodDates = Table.ExpandListColumn ( periods, "Date" ),
    
    // Change the type of the Date column to date
    changedType = Table.TransformColumnTypes ( expandedPeriodDates, {{"Date", type date}} )
    
in
    changedType
