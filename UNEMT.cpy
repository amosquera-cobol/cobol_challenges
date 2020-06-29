       01  Record-Table-Size   PIC S9(03) USAGE IS COMP.
       01  Record-Table-Index  PIC S9(03) USAGE IS COMP.
      *
       01  Program-Action      PIC X(03).
           88 All-Records      VALUE 'ALL'.
      *
       01  Record-Table.
       02  TBL-Unemployment-Claim OCCURS 1 TO 999 TIMES
            DEPENDING ON Record-Table-Size.
           05 Record-ID                           PIC X(08).
           05 Record-Date.
              10 DD                               PIC 9(02).
              10 MM                               PIC 9(02).
              10 YY                               PIC 9(04).
           05 Record-Age.
              10 Exist                            PIC X(03).
              10 INA                              PIC 9(06).
              10 Under-22                         PIC 9(06).
              10 F-22-24                          PIC 9(06).
              10 F-25-34                          PIC 9(06).
              10 F-35-44                          PIC 9(06).
              10 F-45-54                          PIC 9(06).
              10 F-55-59                          PIC 9(06).
              10 F-60-64                          PIC 9(06).
              10 Over-65                          PIC 9(06).
           05 Record-Ethnicity.
              10 Exist                            PIC X(03).
              10 INA                              PIC 9(06).
              10 Latino-Hispanic                  PIC 9(06).
              10 Not-Latino-Hispanic              PIC 9(06).
           05 Record-Industry.
              10 Exist                            PIC X(03).
              10 INA                              PIC 9(06).
              10 Wholesale-Trade                  PIC 9(06).
              10 Transportation-Warehouse         PIC 9(06).
              10 Construction                     PIC 9(06).
              10 Finance-Insurance                PIC 9(06).
              10 Manufacturing                    PIC 9(06).
              10 Agri-For-Fish-Hunt               PIC 9(06).
              10 Public-Admin                     PIC 9(06).
              10 Utilities                        PIC 9(06).
              10 Accom-Food-Services              PIC 9(06).
              10 Information                      PIC 9(06).
              10 Prof-Scientif-Tech               PIC 9(06).
              10 Real-Estate                      PIC 9(06).
              10 Other-Services                   PIC 9(06).
              10 Management-Comp                  PIC 9(06).
              10 Educational-Services             PIC 9(06).
              10 Mining                           PIC 9(06).
              10 Health-Care-Social-Assis         PIC 9(06).
              10 Arts-Entertainment               PIC 9(06).
              10 Admin-Support-Waste-Mgmt         PIC 9(06).
              10 Retail-Trade                     PIC 9(06).
           05 Record-Race.
              10 Exist                            PIC X(03).
              10 INA                              PIC 9(06).
              10 White                            PIC 9(06).
              10 Asian                            PIC 9(06).
              10 African-American                 PIC 9(06).
              10 Native-American-Alaskan          PIC 9(06).
              10 Native-Hawaian-Pacific           PIC 9(06).
           05 Record-Gender.
              10 Exist                            PIC X(03).
              10 INA                              PIC 9(06).
              10 Male                             PIC 9(06).
              10 Female                           PIC 9(06).
