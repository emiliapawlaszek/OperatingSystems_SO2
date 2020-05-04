#!/bin/bash

# a) Dla każdego procesu, który zużywa więcej pamięci niż 0.1% wyświetlić:
# "Użytkownik ____ ma uruchomiony proces o PID ____ - CPU = ___, MEM = ___".
ps aux | awk '
  BEGIN {
    print "---Punkt a)---";
  }
  {
   if( $4 > 0.1) {
     print "Użytkownik " $1 " ma uruchomiony proces o PID " $2 " - CPU = " $3 ", MEM = " $4 ".";
   }
  }'

# b) Dla każdego procesu, który trwa dłużej niż 0:05 wyświetlić:
# "Proces o PID ___ trwa: ___" - przy czym czas zawsze wyświetlać w minutach(nawet jeśli powyżej 59)
ps aux | awk '
  BEGIN {
    print "---Punkt b)---";
  }
  {
    split($10, a, ":");
    minutes = a[2] + a[1]*60;

    if( minutes > 5 ) {
      print "Proces o PID " $2 " trwa: " minutes ".";
   }
  }'

# c) Suma zużycia CPU i osobno MEM: "Suma CPU: ___, Suma MEM: ___"
ps aux | awk '
  BEGIN {
    print "---Punkt c)---";
    cpu = 0;
    mem = 0;
  }
  {
    cpu += $3;
    mem += $4;
  }
  END {
    print "Suma CPU: " cpu", Suma MEM: " mem ".";
  }'

# d) Podobnie co c, ale suma dla wszystkich użytkowników
# np: "Użytkownik ____ łącznie zużywa CPU: ___ i MEM: ___"
ps aux | awk '
  BEGIN {
    print "---Punkt d)---";
  }
  {
    if( $1 in cpu ) {
      cpu[$1] = cpu[$1] + $3;
      mem[$1] = mem[$1] + $4;
    } else {
      cpu[$1] = $3;
      mem[$1] = $4;
    }
  }
  END {
    for( i in cpu ) {
      print "Użytkownik " i " łącznie zużywa CPU: " cpu[i] " i MEM: " mem[i]".";
    }
  }'

# e) Znajdzie użytkownika, który zużywa najwięcej CPU i takiego, który zużywa najwięcej
# MEM: "Użytkownik ___ zużywa najwięcej CPU: ___. Użytkownik ___ zużywa najwięcej MEM: ___"
ps aux | awk '
  BEGIN {
    print "---Punkt e)---";
  }
  {
    if( $1 in cpu ) {
      cpu[$1] = cpu[$1] + $3;
      mem[$1] = mem[$1] + $4;
    } else {
      cpu[$1] = $3;
      mem[$1] = $4;
    }
  }
  END {
    maxCpu = cpu[1];
    maxCpuUser = $1;
    for( i in cpu ) {
      if ( cpu[i] > maxCpu ) {
        maxCpu = cpu[i];
        maxCpuUser = i;
      }
    }
    maxMem = mem[1];
    maxMemUser = $1;
    for( i in mem) {
      if ( mem[i] > maxMem ) {
        maxMem = mem[i];
        maxMemUser = i;
      }
    }
  }
  END {
    print "Użytkownik " maxCpuUser " zużywa najwięcej CPU: " maxCpu ".";
    print "Użytkownik "maxMemUser " zużywa najwięcej MEM: " maxMem ".";
  }'
