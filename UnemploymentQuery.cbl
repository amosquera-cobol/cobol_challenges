      *****************************************************************
      * Program name:    UNEMQUE
      * Original author: DAVID QUINTERO
      *
      * Maintenence Log
      * Date      Author        Maintenance Requirement
      * --------- ------------  ---------------------------------------
      * 09/05/20 DAVID QUINTERO  Created for COBOL class
      *
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  UNEMQUE.
       AUTHOR. DAVID QUINTERO.
       INSTALLATION. COBOL DEVELOPMENT CENTER.
       DATE-WRITTEN. 09/05/2020.
       DATE-COMPILED. 09/05/2020.
       SECURITY. NON-CONFIDENTIAL.
      *****************************************************************
      *****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-3081.
       OBJECT-COMPUTER. IBM-3081.
      *****************************************************************
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INFILE ASSIGN  TO INDD.
           SELECT OUTFILE ASSIGN TO OUTDD.
      *****************************************************************
      *****************************************************************
       DATA DIVISION.
       FILE SECTION.
       FD  INFILE
            LABEL RECORDS ARE STANDARD
            DATA RECORD IS Unem-Claim-ID
            RECORD CONTAINS 80 CHARACTERS
            RECORDING MODE IS F
            BLOCK CONTAINS 1 RECORDS.
       01  U-Struct.
           05  Unem-Claim-ID    PIC X(8) OCCURS 10 TIMES.
       FD  OUTFILE
           RECORDING MODE IS F.
       01  Out-Line.
           05  Out-Char         PIC X    OCCURS 2000 TIMES.
      *****************************************************************
       WORKING-STORAGE SECTION.
           COPY UNEMT.
           COPY UNEMFORM.
      *****************************************************************
      *****************************************************************
       PROCEDURE DIVISION.
       Main-Paragraph.
           OPEN INPUT INFILE
      *
           READ INFILE
           END-READ
      *
           PERFORM Program-Options
      *
           OPEN OUTPUT OUTFILE
      *
           CALL 'UNEMREAD' USING Record-Table-Size,
                                 Record-Table-Index,
                                 Program-Action,
                                 Record-Table
           END-CALL
      *
           IF Record-Table-Size > 0 THEN
               PERFORM Write-Headers
      *
               PERFORM Write-Record VARYING Record-Table-Index
                  FROM 1 BY 1
                  UNTIL Record-Table-Index > Record-Table-Size
      *
           ELSE
               DISPLAY Unem-Claim-ID (1), ' not found.'
           END-IF.
      **
      **
       End-Program.
           CLOSE INFILE
           CLOSE OUTFILE
      *
           GOBACK.
      **
      **
       Program-Options.
           IF Unem-Claim-ID (1) = 'ALL' THEN
               MOVE Unem-Claim-ID (1) TO Program-Action
      *
           ELSE
               IF Unem-Claim-ID (1) IS NUMERIC THEN
                   MOVE 1 TO Record-Table-Size
                   MOVE Unem-Claim-ID (1)
                       TO Record-ID OF TBL-Unemployment-Claim (1)
      *
               ELSE
                   DISPLAY 'Invalid command: enter an 8-digit ',
                       'id for a single record, or ALL for all records'
      *
                   GO TO End-Program
               END-IF
      *
           END-IF.
      **
      **
       Write-Headers.
           MOVE HEADER-1 TO Out-Line
           WRITE Out-Line
      *
           MOVE HEADER-2 TO Out-Line
           WRITE Out-Line
      *
           MOVE SPACES TO HEADER-2.
      **
      **
       Write-Record.
           MOVE SPACES TO Out-Line, HEADER-2
      *
           MOVE CORRESPONDING
               TBL-Unemployment-Claim (Record-Table-Index)
               TO FORMAT-Unemployment-Claim
      *
           MOVE FORMAT-Unemployment-Claim TO Out-Line
           WRITE Out-Line.

