**<u>CosmosDB: Data Consistency:</u>**

Now another advantage of using a database like Cosmos DB is this concept of consistency.
If you go into Settings, under Default consistency,
we can see that the session consistency is the default.
Now there are five choices to choose from.
I do like this image, or this animation
that Microsoft has that explains
what consistency looks like.
So if we start on the left with Strong consistency,
its basically guaranteed
that when a region writes a piece of data
that all of the other replicated regions
are able to read that data at the exact same moment.
In some sense, there's a delay in the writing,
such that the data gets replicated to all regions
and then it's available to everyone.
So we've got a perfect consistency across all the regions.
The Canada East isn't going to read the data,
and be a little bit behind something that was written,
or another region has access to.
There's a concept of Boundless.
Bounded Staleness here,
and we can see that the data is going to be consistent.
You see it's being deployed in
the colors of the notes here
are coming out in the same order,
but you can define the Maximum Lag Time.
So Maximum Lag is here, and the note says
that it is minimum of five seconds for a single region,
and five minutes for multiple regions.
Up to one day.
So if you said, "You know what, I'm okay
with there being five minute delay
between the time that I write,
and the time it's available in all the regions."
Then you can use this Bounded Staleness,
and we can see here the data's being written
and it gets a little bit of a delay,
in terms of the data being available in other regions.
Now Session is the default,
41

41

00:02:10,170  -->  00:02:13,000
and basically what it allows is
42

42

00:02:13,000  -->  00:02:17,210
that depending on the session of the user,
43

43

00:02:17,210  -->  00:02:19,640
that person's going to get consistency.
44

44

00:02:19,640  -->  00:02:23,010
So in Session A, they can write here,
45

45

00:02:23,010  -->  00:02:25,200
and then read in another region,
46

46

00:02:25,200  -->  00:02:26,820
and they're going to have consistency
47

47

00:02:26,820  -->  00:02:29,283
cause they're reading from the same session.
48

48

00:02:30,210  -->  00:02:31,580
Where as another session,
49

49

00:02:31,580  -->  00:02:33,930
another client in a different region,
50

50

00:02:33,930  -->  00:02:35,263
will see the same data.
51

51

00:02:36,224  -->  00:02:38,610
Basically it's going to be consistent,
52

52

00:02:38,610  -->  00:02:42,010
but there's going to be an undefined delay
53

53

00:02:42,010  -->  00:02:43,550
between of each of them.
54

54

00:02:43,550  -->  00:02:44,960
So this a little bit confusing,
55

55

00:02:44,960  -->  00:02:48,490
in terms of type of consistency model,
56

56

00:02:48,490  -->  00:02:51,800
but basically the same client, the same application,
57

57

00:02:51,800  -->  00:02:55,630
could access the data in three regions in this case,
58

58

00:02:55,630  -->  00:03:00,630
and they'll have the same data read in A, B, and C.
59

59

00:03:01,610  -->  00:03:03,370
All returns the same result.
60

60

00:03:03,370  -->  00:03:05,160
Where as a different client might get
61

61

00:03:05,160  -->  00:03:07,033
a little bit of an earlier result.
62

62

00:03:09,120  -->  00:03:11,810
Coming up next is called Consistent Prefix
63

63

00:03:12,810  -->  00:03:17,810
and basically going to be all is displayed in the right order.
64

64

00:03:18,230  -->  00:03:22,720
But we can see that there is a definite lag
65

65

00:03:22,720  -->  00:03:24,330
between the time it's written,
66

66

00:03:24,330  -->  00:03:27,910
and when any particular region has it available for writing,
67

67

00:03:27,910  -->  00:03:29,770
but there is a guarantee that
68

68

00:03:29,770  -->  00:03:32,890
the data updates will always come in the right order.
69

69

00:03:32,890  -->  00:03:35,320
It's going to be A, A-B, A-B-C,
70

70

00:03:35,320  -->  00:03:38,320
but it'll never be B-A-C, in terms of updates.
71

71

00:03:38,320  -->  00:03:40,360
Everything's guaranteed in the order,
72

72

00:03:40,360  -->  00:03:42,160
but there's really no guarantee
73

73

00:03:42,160  -->  00:03:46,003
as to when a particular region gets the next update.
74

74

00:03:47,560  -->  00:03:50,555
Now Eventual consistency is called the weakest one,
75

75

00:03:50,555  -->  00:03:53,360
and in this case there's just no guarantee
76

76

00:03:53,360  -->  00:03:55,710
that they're going to in the right order.
77

77

00:03:55,710  -->  00:03:57,630
So this is for the type of data,
78

78

00:03:57,630  -->  00:04:00,023
where it doesn't matter what order they come in.
79

79

00:04:01,040  -->  00:04:05,200
Microsoft gives the example of retweets, likes, comments
80

80

00:04:05,200  -->  00:04:06,700
that are not in a threaded fashion.
81

81

00:04:06,700  -->  00:04:09,930
So anything where it doesn't matter that A was before B,
82

82

00:04:09,930  -->  00:04:13,610
as long as A and B eventually get displayed.
83

83

00:04:13,610  -->  00:04:15,600
Then this is the kind of data model
84

84

00:04:15,600  -->  00:04:17,313
you would choose for this.
85

85

00:04:19,950  -->  00:04:21,780
If you really do require
86

86

00:04:21,780  -->  00:04:24,450
that if you're going to write to the database,
87

87

00:04:24,450  -->  00:04:25,990
and every region of the world
88

88

00:04:25,990  -->  00:04:27,380
that your database is deployed to
89

89

00:04:27,380  -->  00:04:30,680
has that data available at the exact same instant,
90

90

00:04:30,680  -->  00:04:31,740
then you're probably going to get
91

91

00:04:31,740  -->  00:04:34,003
pulled toward Strong consistency.
92

92

00:04:34,890  -->  00:04:39,130
If you're fine with a little bit of a lag,
93

93

00:04:39,130  -->  00:04:40,640
some data gets written in Canada,
94

94

00:04:40,640  -->  00:04:43,780
but it takes a few seconds to get to Australia,
95

95

00:04:43,780  -->  00:04:46,200
and maybe another few seconds to get to Europe,
96

96

00:04:46,200  -->  00:04:49,830
then you would choose something like this.
97

97

00:04:49,830  -->  00:04:52,970
Of course you don't want the same client
98

98

00:04:52,970  -->  00:04:55,160
to read one piece of data in one database,
99

99

00:04:55,160  -->  00:04:59,190
and read a different piece of data in a different database.
100

100

00:04:59,190  -->  00:05:01,160
Maybe Session consistency is best
101

101

00:05:01,160  -->  00:05:03,253
when it's bound to the client.
102

102

00:05:04,500  -->  00:05:07,770
For the exam it probably would be smart
103

103

00:05:07,770  -->  00:05:12,100
to review these types of consistencies,
104

104

00:05:12,100  -->  00:05:14,560
and understand under what circumstances
105

105

00:05:14,560  -->  00:05:16,740
you would choose a Strong consistency,
106

106

00:05:16,740  -->  00:05:20,520
what circumstances you would choose a Session consistency,
107

107

00:05:20,520  -->  00:05:22,110
and maybe what circumstances are best
108

108

00:05:22,110  -->  00:05:24,760
for something like an Eventual consistency.
109

109

00:05:24,760  -->  00:05:26,860
Where the order of the data doesn't matter
110

110

00:05:26,860  -->  00:05:29,383
as long as you have the sum total of the data.
Hopefully that makes sense in terms of consistency.
Which is one option that you have
for Cosmos DB that you don't have
for a table story, to counter for instance.