      *****************************************************************
      * Program name:    UNEM
      * Original author: DAVID QUINTERO
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 05/05/20 DAVID QUINTERO  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEM.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 05/05/20.
       DATE-COMPILED. 05/05/20.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CSV-Age ASSIGN TO CSVAGE
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-Age-Status.
      *
           SELECT CSV-Ethnicity ASSIGN TO CSVETH
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-Ethnicity-Status.
      *
           SELECT CSV-Industry ASSIGN TO CSVIND
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-Industry-Status.
      *
           SELECT CSV-Race ASSIGN TO CSVRAC
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-Race-Status.
      *
           SELECT CSV-Gender ASSIGN TO CSVGEN
             ORGANIZATION IS SEQUENTIAL
             ACCESS MODE  IS SEQUENTIAL
             FILE STATUS  IS CSV-Gender-Status.
      *
           SELECT Unemployment-Claims-File ASSIGN TO UNDD
             ORGANIZATION IS INDEXED
             ACCESS MODE  IS DYNAMIC
             RECORD KEY   IS Record-ID
             FILE STATUS  IS Unemployment-File-Status.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  CSV-Age
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-Age-Line
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-Age-Line    PIC X(3000).
      *
       FD  CSV-Ethnicity
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-Ethnicity-Line
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-Ethnicity-Line    PIC X(3000).
      *
       FD  CSV-Industry
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-Industry-Line
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-Industry-Line    PIC X(3000).
      *
       FD  CSV-Race
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-Race-Line
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-Race-Line    PIC X(3000).
      *
       FD  CSV-Gender
           RECORDING MODE IS F
           LABEL RECORDS ARE STANDARD
           DATA RECORD IS CSV-Gender-Line
           RECORD CONTAINS 3000 CHARACTERS
           BLOCK CONTAINS 0 RECORDS.
       01  CSV-Gender-Line    PIC X(3000).
      *
       FD  Unemployment-Claims-File
            DATA RECORD IS Unemployment-Claim.
      *****************************************************************
      *          Each unemployment claim is 268 characters long
      *****************************************************************
           COPY UNEMC.
      **
      **
       WORKING-STORAGE SECTION.
      *
       01  CSV-Age-Status           PIC 99.
           88  CSV-Age-Ok           VALUE 00.
           88  CSV-Age-EOF          VALUE 01.
       01  CSV-Ethnicity-Status     PIC 99.
           88  CSV-Ethnicity-Ok     VALUE 00.
           88  CSV-Ethnicity-EOF    VALUE 01.
       01  CSV-Industry-Status      PIC 99.
           88  CSV-Industry-Ok      VALUE 00.
           88  CSV-Industry-EOF     VALUE 01.
       01  CSV-Race-Status          PIC 99.
           88  CSV-Race-Ok          VALUE 00.
           88  CSV-Race-EOF         VALUE 01.
       01  CSV-Gender-Status        PIC 99.
           88  CSV-Gender-Ok        VALUE 00.
           88  CSV-Gender-EOF       VALUE 01.
      *
       01  Unemployment-File-Status PIC 99.
           88 Unemployment-File-Ok               VALUE 00.
           88 Unemployment-File-May-Exist        VALUE 35.
      *****************************************************************
      *****************************************************************
       PROCEDURE DIVISION.
      *****************************************************************
      *                          Main Section
      *****************************************************************
       Main SECTION.
      **
      **
       Main-Paragraph.
           PERFORM File-Management
           PERFORM Writing-VSAM UNTIL CSV-Gender-EOF.
      *
      *
       Program-End.
           CLOSE CSV-Age, CSV-Ethnicity, CSV-Gender, CSV-Industry,
               CSV-Race
           CLOSE Unemployment-Claims-File
           GOBACK.
      **
      **
      *****************************************************************
      *                    File Management Section
      *****************************************************************
       File-Management SECTION.
      **
      **
       Open-CSV-Files.
           OPEN INPUT CSV-Age, CSV-Ethnicity, CSV-Gender, CSV-Industry,
               CSV-Race
      *
           IF NOT CSV-Age-Ok
               DISPLAY 'CSV Age File: ', CSV-Age-Status
               GO TO Program-End
           END-IF
      *
           IF NOT CSV-Ethnicity-Ok
               DISPLAY 'CSV Ethnicity File: ', CSV-Ethnicity-Status
               GO TO Program-End
           END-IF
      *
           IF NOT CSV-Industry-Ok
               DISPLAY 'CSV Industry File: ', CSV-Industry-Status
               GO TO Program-End
           END-IF
      *
           IF NOT CSV-Race-Ok
               DISPLAY 'CSV Race File: ', CSV-Race-Status
               GO TO Program-End
           END-IF
      *
           IF NOT CSV-Gender-Ok
               DISPLAY 'CSV Age File Error: ', CSV-Gender-Status
               GO TO Program-End
           END-IF.
      *
      *
       Open-Unemployment-Claims-File.
           OPEN I-O Unemployment-Claims-File
      *
           EVALUATE Unemployment-File-Status
             WHEN 00
               DISPLAY 'FILE OK'
      *
             WHEN 35
               CLOSE Unemployment-Claims-File
      *
               OPEN OUTPUT Unemployment-Claims-File
      *
               IF NOT Unemployment-File-Ok THEN
                  DISPLAY 'Unemployment file status code: ',
                    Unemployment-File-Status
      *
                  GO TO Program-End
      *
               ELSE
                  CLOSE Unemployment-Claims-File
                  OPEN I-O Unemployment-Claims-File
               END-IF
      *
             WHEN OTHER
                DISPLAY 'Unemployment file status code: ',
                    Unemployment-File-Status
      *
                GO TO Program-End
           END-EVALUATE.
      *
      *
       Read-Headers.
           READ CSV-Age
           END-READ
           READ CSV-Ethnicity
           END-READ
           READ CSV-Industry
           END-READ
           READ CSV-Gender
           END-READ
           READ CSV-Race
           END-READ.
      **
      **
      *****************************************************************
      *                    Writing-VSAM Section
      *****************************************************************
       Writing-VSAM SECTION.
      **
      **
       Clean-Record.
           MOVE ZEROES TO Unemployment-Claim
           MOVE "N/A" TO Exist OF Record-Age, Exist OF Record-Ethnicity
               Exist OF Record-Gender, Exist OF Record-Race,
               Exist OF Record-Race.
      *
      *
       Write-Age-Record.
           READ CSV-Age
               AT END
                 SET CSV-Age-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-Age-Line DELIMITED BY "," INTO Record-ID
                 END-UNSTRING
                 READ Unemployment-Claims-File
                   INVALID KEY
      *
                    PERFORM Parse-CSV-Age
                    WRITE Unemployment-Claim END-WRITE
      *
                   NOT INVALID KEY
      *
                    PERFORM Parse-CSV-Age
                    REWRITE Unemployment-Claim END-REWRITE
      *
                 END-READ
      *
           END-READ.
      *
      *
       Write-Ethnic-Record.
           PERFORM Clean-Record
      *
           READ CSV-Ethnicity
               AT END
                 SET CSV-Ethnicity-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-Ethnicity-Line
                   DELIMITED BY "," INTO Record-ID
                 END-UNSTRING
      *
                READ Unemployment-Claims-File
                   INVALID KEY
      *
                    PERFORM Parse-CSV-Ethnicity
                    WRITE Unemployment-Claim END-WRITE
      *
                   NOT INVALID KEY
      *
                    PERFORM Parse-CSV-Ethnicity
                    REWRITE Unemployment-Claim END-REWRITE
      *
                 END-READ
      *
           END-READ.
      **
      **
       Write-Industry-Record.
           PERFORM Clean-Record
      *
           READ CSV-Industry
              AT END
                 SET CSV-Industry-EOF TO TRUE
      *
               NOT AT END
      *
                 UNSTRING CSV-Industry-Line
                       DELIMITED BY "," INTO Record-ID
                 END-UNSTRING
      *
                 READ Unemployment-Claims-File
                   INVALID KEY
      *
                     PERFORM Parse-CSV-Industry
                     WRITE Unemployment-Claim END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM Parse-CSV-Industry
                     REWRITE Unemployment-Claim END-REWRITE
                 END-READ
      *
           END-READ.
      *
      *
       Write-Race-Record.
           PERFORM Clean-Record
           READ CSV-Race
               AT END
      *
                 SET CSV-Race-EOF TO TRUE
               NOT AT END
      *
                 UNSTRING CSV-Race-Line
                       DELIMITED BY "," INTO Record-ID
                 END-UNSTRING
                 READ Unemployment-Claims-File
                   INVALID KEY
      *
                     PERFORM Parse-CSV-Race
                     WRITE Unemployment-Claim END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM Parse-CSV-Race
                     REWRITE Unemployment-Claim END-REWRITE
                 END-READ
      *
           END-READ.
      *
      *
       Write-Gender-Record.
           PERFORM Clean-Record
           READ CSV-Gender
               AT END
      *
                 SET CSV-Gender-EOF TO TRUE
               NOT AT END
                 UNSTRING CSV-Gender-Line
                       DELIMITED BY "," INTO Record-ID
                 END-UNSTRING
      *
                 READ Unemployment-Claims-File
                   INVALID KEY
      *
                     PERFORM Parse-CSV-Gender
                     WRITE Unemployment-Claim END-WRITE
      *
                   NOT INVALID KEY
      *
                     PERFORM Parse-CSV-Gender
                     REWRITE Unemployment-Claim END-REWRITE
                 END-READ
      *
           END-READ.
      **
      **
      *****************************************************************
      *                    Unstrings Section
      *****************************************************************
       Unstrings SECTION.
      *
      *
       Parse-CSV-Age.
           MOVE 'T/T'   TO Exist OF Record-Age
      *
           UNSTRING CSV-Age-Line
             DELIMITED BY "," OR "/" OR SPACE INTO
               Record-ID, DD, MM, YY, INA OF Record-Age,
               Under-22, F-22-24, F-25-34, F-35-44, F-45-54,
               F-55-59, F-60-64, Over-65
           END-UNSTRING.
      *
      *
       Parse-CSV-Ethnicity.
           MOVE 'T/T'   TO Exist OF Record-Ethnicity
      *
           UNSTRING CSV-Ethnicity-Line
             DELIMITED BY "," OR "/" OR SPACE INTO
                Record-ID, DD, MM, YY, INA OF Record-Ethnicity,
                Latino-Hispanic, Not-Latino-Hispanic
           END-UNSTRING.
      *
      *
       Parse-CSV-Industry.
           MOVE 'T/T' TO Exist OF Record-Industry
      *
           UNSTRING CSV-Industry-Line
             DELIMITED BY "," OR "/" OR SPACE INTO
              Record-ID, DD, MM, YY, INA OF Record-Industry,
              Wholesale-Trade,
              Transportation-Warehouse,
              Construction,
              Finance-Insurance,
              Manufacturing,
              Agri-For-Fish-Hunt,
              Public-Admin,
              Utilities,
              Accom-Food-Services,
              Information,
              Prof-Scientif-Tech,
              Real-Estate,
              Other-Services,
              Management-Comp,
              Educational-Services,
              Mining,
              Health-Care-Social-Assis,
              Arts-Entertainment,
              Admin-Support-Waste-Mgmt,
              Retail-Trade
           END-UNSTRING.
      *
      *
       Parse-CSV-Race.
           MOVE 'T/T'   TO Exist OF Record-Race
      *
           UNSTRING CSV-Race-Line
             DELIMITED BY "," OR "/" OR SPACE INTO
               Record-ID, DD, MM, YY, INA OF Record-Race,
               White, Asian, African-American
               Native-American-Alaskan,
               Native-Hawaian-Pacific
           END-UNSTRING.
      *
      *
      *
       Parse-CSV-Gender.
           MOVE 'T/T'   TO Exist OF Record-Gender
      *
           UNSTRING CSV-Gender-Line
             DELIMITED BY "," OR "/" OR SPACE INTO
              Record-ID, DD, MM, YY, INA OF Record-Gender,
              Male, Female
           END-UNSTRING.
      *

