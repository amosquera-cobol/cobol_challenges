       01  HEADER-1.
           05                    PIC X(18) VALUE 'ID'.
           05 Record-Date        PIC X(20) VALUE 'DATE'.
           05                    PIC X(10) VALUE SPACES.
           05 Record-Age.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
              10                          PIC X(04) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE 'AGE'.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
           05                             PIC X(08) VALUE SPACES.
           05 Record-Ethnicity.
              10                          PIC X(18) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ETHNICI'.
              10                          PIC X(08) VALUE 'TY'.
              10                          PIC X(11) VALUE SPACE.
           05                             PIC X(06) VALUE SPACES.
           05 Record-Industry.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INDUSTR'.
              10                          PIC X(08) VALUE 'Y'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE SPACE.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
           05                             PIC X(10) VALUE SPACES.
           05 Record-Race.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE 'RACE'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE SPACE.
           05                             PIC X(05) VALUE SPACE.
           05 Record-Gender.
              10                          PIC X(11) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE 'GENDER'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE SPACE.
      *
       01  HEADER-2.
           05                    PIC X(08) VALUE 'ID'.
           05                    PIC X(10) VALUE SPACES.
           05 Record-Date.
              10                          PIC X(02) VALUE 'DD'.
              10                          PIC X VALUE '/'.
              10                          PIC X(02) VALUE 'MM'.
              10                          PIC X VALUE '/'.
              10                          PIC X(04) VALUE 'YY'.
           05                             PIC X(10) VALUE SPACES.
           05 Record-Age.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'Under 22'.
              10                          PIC X(04) VALUE SPACE.
              10                          PIC X(09) VALUE '[22 - 24]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[25 - 34]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[35 - 44]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[45 - 54]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[55 - 59]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE '[60 - 64]'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE 'Over 65'.
           05                             PIC XX(08) VALUE SPACES.
           05 Record-Ethnicity.
              10                          PIC X(03) VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHITE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'LAT-HIS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(11) VALUE 'NON-LAT-HIS'.
           05                             PIC X(06) VALUE SPACES.
           05 Record-Industry.
              10                          PIC X(03) VALUE 'N/A'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHOLST'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'TRANSWR'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'CONSTR'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'FIN-INS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MANUFAC'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'AG-FIS-HUN'.
              10                          PIC X(05) VALUE SPACE.
              10                          PIC X(09) VALUE 'PUBLIC-AD'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'UTILS'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE 'ACOM-FOOD'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'INFORM'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'PR-SC-T'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(08) VALUE 'RE-STATE'.
              10                          PIC X(07) VALUE SPACE.
              10                          PIC X(07) VALUE 'OTHER-S'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MANAG-C'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'EDUC-S'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MINING'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'HEALTH'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ARTS-EN'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(09) VALUE 'WASTE-MAG'.
              10                          PIC X(06) VALUE SPACE.
              10                          PIC X(07) VALUE 'RETAIL'.
           05                             PIC X(10) VALUE SPACES.
           05 Record-Race.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'WHITE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'ASIAN'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'AF-AM'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'NAT-AL'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(10) VALUE 'NAT-HAW-PA'.
           05                             PIC X(05) VALUE SPACES.
           05 Record-Gender.
              10                          PIC X(03)   VALUE "N/A".
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'INA'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'MALE'.
              10                          PIC X(08) VALUE SPACE.
              10                          PIC X(07) VALUE 'FEMALE'.
      *
      *
       01  FORMAT-Unemployment-Claim REDEFINES HEADER-2.
           05 Record-ID                   PIC X(08).
           05                             PIC X(10).
           05 Record-Date.
              10 DD                       PIC 9(02).
              10                          PIC X.
              10 MM                       PIC 9(02).
              10                          PIC X.
              10 YY                       PIC 9(04).
           05                             PIC X(10).
           05 Record-Age.
              10 Exist                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Under-22                 PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-22-24                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-25-34                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-35-44                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-45-54                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-55-59                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 F-60-64                  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Over-65                  PIC ZZZ,ZZ9.
           05                             PIC XX(08).
           05 Record-Ethnicity.
              10 Exist                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Latino-Hispanic          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Not-Latino-Hispanic      PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 Record-Industry.
              10 Exist                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Wholesale-Trade          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Transportation-Warehouse PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Construction             PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Finance-Insurance        PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Manufacturing            PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Agri-For-Fish-Hunt       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Public-Admin             PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Utilities                PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Accom-Food-Services      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Information              PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Prof-Scientif-Tech       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Real-Estate              PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Other-Services           PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Management-Comp          PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Educational-Services     PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Mining                   PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Health-Care-Social-Assis PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Arts-Entertainment       PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Admin-Support-Waste-Mgmt PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Retail-Trade             PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 Record-Race.
              10 Exist                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 White                    PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Asian                    PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 African-American         PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Native-American-Alaskan  PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Native-Hawaian-Pacific   PIC ZZZ,ZZ9.
           05                             PIC X(10).
           05 Record-Gender.
              10 Exist                    PIC X(03).
              10                          PIC X(08).
              10 INA                      PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Male                     PIC ZZZ,ZZ9.
              10                          PIC X(08).
              10 Female                   PIC ZZZ,ZZ9.
