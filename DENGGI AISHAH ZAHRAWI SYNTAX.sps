* Encoding: UTF-8.

*PRE.....

RECODE y32pre (1=0) (0=1) INTO y32pre.n.
EXECUTE.

RECODE y32post (1=0) (0=1) INTO y32post.n.
EXECUTE.

*POST...

*PENGIRAAN

COMPUTE preSUM=SUM(y1pre,y2pre,y3pre,y4pre,y5pre,y6pre,y7pre,y8pre,y9pre,y10pre,y11pre,y12pre,
    y13pre,y14pre,y15pre,y16pre,y17pre,y18pre,y19pre,y20pre,y21pre,y22pre,y23pre,y24pre,y25pre,y26pre,
    y27pre,y28pre,y29pre,y30pre,y31pre,y32pre.n).
EXECUTE.

*Knowledge

COMPUTE preKNOW=SUM(y1pre,y2pre,y3pre,y4pre,y5pre,y6pre,y7pre,y8pre,y9pre,y10pre,y11pre,y12pre).
EXECUTE.

*Attitude

COMPUTE preATT=SUM(y13pre,y14pre,y15pre,y16pre,y17pre,y18pre,y19pre,y20pre,y21pre).
EXECUTE.

*Practice

COMPUTE prePRAC=SUM(y22pre,y23pre,y24pre,y25pre,y26pre,y27pre,y28pre,y29pre,y30pre,y31pre,y32pre.n).
EXECUTE.

*POST ANALYSIS

*Knowledge

COMPUTE postKNOW=SUM(y1post,y2post,y3post,y4post,y5post,y6post,y7post,y8post,y9post,y10post,y11post,y12post).
EXECUTE.

*Attitude

COMPUTE postATT=SUM(y13post,y14post,y15post,y16post,y17post,y18post,y19post,y20post,y21post).
EXECUTE.

*Practice

COMPUTE postPRAC=SUM(y22post,y23post,y24post,y25post,y26post,y27post,y28post,y29post,y30post,y31post,y32post.n).
EXECUTE.

*// HYPOTHESIS TEST

FREQUENCIES VARIABLES=x1 x2 x3 x4 x5 x6 x7 x8
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES= y1pre,y2pre,y3pre,y4pre,y5pre,y6pre,y7pre,y8pre,y9pre,y10pre,y11pre,y12pre,
    y13pre,y14pre,y15pre,y16pre,y17pre,y18pre,y19pre,y20pre,y21pre,y22pre,y23pre,y24pre,y25pre,y26pre,
    y27pre,y28pre,y29pre,y30pre,y31pre,y32pre.n
  /ORDER=ANALYSIS.

*UJIAN BERBEZA

T-TEST PAIRS=preKNOW WITH postKNOW (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=preATT WITH postATT (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=prePRAC WITH postPRAC (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
