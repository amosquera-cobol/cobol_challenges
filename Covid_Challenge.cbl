      *****************************************************************
      * Program name:    COVID
      * Original author: DAVID QUINTERO
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 28/04/2020 DAVID QUINTERO  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  COVID.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 28/04/2020.
       DATE-COMPILED. 28/04/2020.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE  ASSIGN  TO CONTXT.
           SELECT OUTFILE ASSIGN  TO OUTRP.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  INFILE
           RECORDING MODE IS F
           RECORD CONTAINS 160 CHARACTERS.
       01  CSV-LINE     PIC X(160).
       FD  OUTFILE
           RECORDING MODE IS F
           RECORD CONTAINS 200 CHARACTERS.
       01  OUT-LINE     PIC X(200).
      *****************************************************************
       WORKING-STORAGE SECTION.
       01  FILE-STATUS  PIC X VALUE SPACE.
           88 EOF       VALUE 'Y'.
      *
       01  PTR-NAME     PIC 999 VALUE 2.
       01  COUNT-NAME   PIC 999 VALUE 0.
      *
      *****************************************************************
      *                         Report elements
      *****************************************************************
       01  DECO-LINE    PIC X(200) VALUE ALL '-'.
      *
       01  REPORT-HEADING-1.
           05 FILLER       PIC X VALUE SPACE.
           05 FILLER       PIC X(22) VALUE "      TIMESPAN".
           05 FILLER       PIC X VALUE SPACE.
           05 FILLER       PIC X(50)
              VALUE "                      COUNTRY".
           05 FILLER       PIC X(09) VALUE "  COUNTRY".
           05 FILLER       PIC X(50)
              VALUE "                      SLUG".
           05 FILLER       PIC X(10) VALUE "    NEW".
           05 FILLER       PIC X(12) VALUE "    TOTAL".
           05 FILLER       PIC X(10) VALUE "     NEW".
           05 FILLER       PIC X(12) VALUE "     TOTAL".
           05 FILLER       PIC X(10) VALUE "     NEW".
           05 FILLER       PIC X(10) VALUE "     TOTAL".
      *
       01  REPORT-HEADING-2.
           05 FILLER       PIC X VALUE SPACE.
           05 FILLER       PIC X(23) VALUE SPACE.
           05 FILLER       PIC X VALUE SPACE.
           05 FILLER       PIC X(50) VALUE SPACE.
           05 FILLER       PIC X(09) VALUE "   CODE".
           05 FILLER       PIC X(50) VALUE SPACE.
           05 FILLER       PIC X(10) VALUE "  CASES".
           05 FILLER       PIC X(12) VALUE "   CASES".
           05 FILLER       PIC X(10) VALUE "   DEATHS".
           05 FILLER       PIC X(12) VALUE "    DEATHS".
           05 FILLER       PIC X(10) VALUE "  RECOVER".
           05 FILLER       PIC X(10) VALUE "   RECOVER".
      *
       01  COUNTRY.
           05 COUNTRY-NAME   PIC X(50).
           05 COUNTRY-CODE   PIC X(03).
           05 SLUG           PIC X(50).
           05 NEW-CASES      PIC 9(06).
           05 TOT-CASES      PIC 9(06).
           05 NEW-DEATHS     PIC 9(06).
           05 TOT-DEATHS     PIC 9(06).
           05 NEW-RECOV      PIC 9(06).
           05 TOT-RECOV      PIC 9(06).
           05 TIMESPAN.
              10 QUOTATION-1 PIC X.
              10 YMD         PIC X(10).
              10 SEP         PIC X VALUE SPACE.
              10 HOUR        PIC X(10).
              10 QUOTATION-2 PIC X.
      *
       01  COUNTRY-COMP.
           05  NEW-CASES   PIC S9(06) COMP-4 VALUE 0.
           05  TOT-CASES   PIC S9(06) COMP-4 VALUE 0.
           05  NEW-DEATHS  PIC S9(06) COMP-4 VALUE 0.
           05  TOT-DEATHS  PIC S9(06) COMP-4 VALUE 0.
           05  NEW-RECOV   PIC S9(06) COMP-4 VALUE 0.
           05  TOT-RECOV   PIC S9(06) COMP-4 VALUE 0.
      *
       01  COUNTRY-PRINT.
           05 FILLER       PIC X     VALUE "|".
           05 TIMESPAN     PIC X(22).
           05 FILLER       PIC X(02) VALUE "| ".
           05 COUNTRY-NAME PIC X(50).
           05 FILLER       PIC X(02) VALUE " |".
           05 COUNTRY-CODE PIC X(03).
           05 FILLER       PIC X(03) VALUE "  |".
           05 SLUG         PIC X(50).
           05 FILLER       PIC X(02) VALUE  " |".
           05 NEW-CASES    PIC ZZZ,ZZ9.
           05 FILLER       PIC X(04) VALUE " |  ".
           05 TOT-CASES    PIC ZZZ,ZZ9.
           05 FILLER       PIC X(04) VALUE "   |".
           05 NEW-DEATHS   PIC ZZZ,ZZ9.
           05 FILLER       PIC X(04) VALUE "   |".
           05 TOT-DEATHS   PIC ZZZ,ZZ9.
           05 FILLER       PIC X(04) VALUE "   |".
           05 NEW-RECOV    PIC ZZZ,ZZ9.
           05 FILLER       PIC X(04) VALUE "   |".
           05 TOT-RECOV    PIC ZZZ,ZZ9.
           05 FILLER       PIC X(03) VALUE "  |".
      *
       01  GLOBAL-TOTALS.
           05  NEW-CASES   PIC S9(07) COMP-4 VALUE 0.
           05  TOT-CASES   PIC S9(07) COMP-4 VALUE 0.
           05  NEW-DEATHS  PIC S9(07) COMP-4 VALUE 0.
           05  TOT-DEATHS  PIC S9(07) COMP-4 VALUE 0.
           05  NEW-RECOV   PIC S9(07) COMP-4 VALUE 0.
           05  TOT-RECOV   PIC S9(07) COMP-4 VALUE 0.
      *
       01  GLOBAL-TOTALS-PRINT.
           05 FILLER       PIC X VALUE SPACE.
           05 TIMESPAN     PIC X(23).
           05 FILLER       PIC X VALUE SPACE.
           05 FILLER       PIC X(108) VALUE 'Global'.
           05 NEW-CASES    PIC Z,ZZZ,ZZ9.
           05 FILLER       PIC X(02) VALUE SPACE.
           05 TOT-CASES    PIC Z,ZZZ,ZZ9.
           05 FILLER       PIC X(02) VALUE SPACE.
           05 NEW-DEATHS   PIC Z,ZZZ,ZZ9.
           05 FILLER       PIC X(02) VALUE SPACE.
           05 TOT-DEATHS   PIC Z,ZZZ,ZZ9.
           05 FILLER       PIC X(02) VALUE SPACE.
           05 NEW-RECOV    PIC Z,ZZZ,ZZ9.
           05 FILLER       PIC X(02) VALUE SPACE.
           05 TOT-RECOV    PIC Z,ZZZ,ZZ9.
      *****************************************************************
      *****************************************************************
      *****************************************************************
       PROCEDURE DIVISION.
           PERFORM OPEN-FILES        THRU WRITE-DECO-LINE
      *****************************************************************
      *            Reads header of CSV file and ignores it.
      *****************************************************************
           READ INFILE
           END-READ
      *****************************************************************
           PERFORM WRITE-REPORT-BODY UNTIL EOF
           PERFORM WRITE-DECO-LINE   THRU  CLOSE-FILES
      *
           GOBACK.
      *
      *
       OPEN-FILES.
           OPEN OUTPUT OUTFILE
           OPEN INPUT INFILE.
      *
      *
       WRITE-HEADINGS.
           MOVE REPORT-HEADING-1 TO OUT-LINE
           WRITE OUT-LINE END-WRITE
      *
           MOVE REPORT-HEADING-2 TO OUT-LINE
           WRITE OUT-LINE END-WRITE.
      *
      *
       WRITE-DECO-LINE.
           MOVE DECO-LINE TO OUT-LINE
           WRITE OUT-LINE END-WRITE.
      *
      *
       WRITE-GLOBAL-TOTALS.
           MOVE CORRESPONDING GLOBAL-TOTALS TO GLOBAL-TOTALS-PRINT
           MOVE TIMESPAN OF COUNTRY TO TIMESPAN OF GLOBAL-TOTALS-PRINT
           MOVE GLOBAL-TOTALS-PRINT TO OUT-LINE
      *
           WRITE OUT-LINE
           END-WRITE.
      *
      *
       CLOSE-FILES.
           CLOSE OUTFILE
           CLOSE INFILE.
      *
      *
       WRITE-REPORT-BODY.
           READ INFILE
                AT END
                  SET EOF TO TRUE
                NOT AT END
                  PERFORM MOVING-FIELDS THRU CAL-GLOBAL-TOTALS
           END-READ.
      *
      *
       MOVING-FIELDS.
           MOVE 2 TO PTR-NAME
           PERFORM BUFFER-TO-COUNTRY-NAME
      *
           UNSTRING CSV-LINE
               DELIMITED BY ","
               INTO
               COUNTRY-CODE OF COUNTRY, SLUG        OF COUNTRY,
               NEW-CASES    OF COUNTRY, TOT-CASES   OF COUNTRY,
               NEW-DEATHS   OF COUNTRY, TOT-DEATHS  OF COUNTRY,
               NEW-RECOV    OF COUNTRY, TOT-RECOV   OF COUNTRY,
               TIMESPAN     OF COUNTRY
               WITH POINTER COUNT-NAME
           END-UNSTRING
      *
           INSPECT COUNTRY-CODE OF COUNTRY REPLACING ALL '"' BY SPACE
           INSPECT SLUG OF COUNTRY REPLACING ALL '"' BY SPACE
           INSPECT TIMESPAN OF COUNTRY REPLACING ALL 'Z' BY SPACE,
              ALL '"' BY SPACE, ALL 'T' BY SPACE.
      *
      *
       WRITE-COUNTRY-RECORD.
           MOVE CORRESPONDING COUNTRY TO COUNTRY-PRINT
           MOVE COUNTRY-PRINT TO OUT-LINE

           WRITE OUT-LINE
           END-WRITE.
      *
      *
       CAL-GLOBAL-TOTALS.
           MOVE CORRESPONDING COUNTRY      TO COUNTRY-COMP
           ADD  CORRESPONDING COUNTRY-COMP TO GLOBAL-TOTALS.
      *
      *
       BUFFER-TO-COUNTRY-NAME.
           UNSTRING CSV-LINE
               DELIMITED BY '"'
               INTO COUNTRY-NAME OF COUNTRY COUNT IN COUNT-NAME
               WITH POINTER PTR-NAME
           END-UNSTRING
      *
           ADD 4 TO COUNT-NAME.
