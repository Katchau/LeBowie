INSERT INTO country (name) VALUES ('portugal');
INSERT INTO country (name) VALUES ('france');
INSERT INTO country (name) VALUES ('spain');
INSERT INTO country (name) VALUES ('england');
INSERT INTO country (name) VALUES ('italy');
INSERT INTO country (name) VALUES ('united states of america');

INSERT INTO badge (color, text) VALUES ('#b445cf', 'novice');
INSERT INTO badge (color, text) VALUES ('#416e70', 'enthusiast');
INSERT INTO badge (color, text) VALUES ('#657590', 'expert');

INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('bluefish389', 'anne.meijerhof@example.com', 'e2fa1364c09f719b337c9b20632e6eed323083aa664b46e9970fe5e560e29088', 'PSBeceFE', 'anne', 'meijerhof', '1983-09-28 08:08:44', 4, 'Administrator');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('beautifulwolf823', 'jannigje.gravesteijn@example.com', 'fcafbc51c2ac40299eefae092922582a079b6f5547a0bd2136849f663cf08072', 'RwLgjEeB', 'jannigje', 'gravesteijn', '1948-10-17 21:54:44', 3, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('greengorilla863', 'julius.pesola@example.com', '62d1c2f2bb89a9c0d3a7b35e1078bdb8f1111f41fdf160dffb6c8a19acfdc523', 'MspDniuM', 'julius', 'pesola', '1988-03-08 07:04:02', 1, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('ticklishpeacock558', 'sarah.chen@example.com', '435ca86e492b5fc62988aadd22777eef591eaa4a84cd0b2e9874c4e3f2fcb142', 'xqJKwRqk', 'sarah', 'chen', '1951-09-18 22:03:15', 6, 'Registered');
INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, user_type) VALUES ('crazyswan876', 'callum.grant@example.com', '8412e34902cb2714bf2d6699b3f24bb22b205b15db05289b1a39669788a5f9d7', '4Vgeggdc', 'callum', 'grant', '1976-11-19 01:27:24', 4, 'Registered');

INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'programming', 'for programmers, just like you.');
INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'mathematics', 'for people studying math at any level.');
INSERT INTO topic (admin_id, topicname, description) VALUES (1, 'aviation', 'for aircraft pilots, mechanics and enthusiasts.');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 17448, 1302);
INSERT INTO postinstance (post_id, user_id, description) VALUES (1, 1, '&lt;p&gt;Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.&lt;/p&gt;

&lt;pre class=&quot;lang-cpp prettyprint-override&quot;&gt;&lt;code&gt;#include &amp;lt;algorithm&amp;gt;
#include &amp;lt;ctime&amp;gt;
#include &amp;lt;iostream&amp;gt;

int main()
{
    // Generate data
    const unsigned arraySize = 32768;
    int data[arraySize];

    for (unsigned c = 0; c &amp;lt; arraySize; ++c)
        data[c] = std::rand() % 256;

    // !!! With this, the next loop runs faster
    std::sort(data, data + arraySize);

    // Test
    clock_t start = clock();
    long long sum = 0;

    for (unsigned i = 0; i &amp;lt; 100000; ++i)
    {
        // Primary loop
        for (unsigned c = 0; c &amp;lt; arraySize; ++c)
        {
            if (data[c] &amp;gt;= 128)
                sum += data[c];
        }
    }

    double elapsedTime = static_cast&amp;lt;double&amp;gt;(clock() - start) / CLOCKS_PER_SEC;

    std::cout &amp;lt;&amp;lt; elapsedTime &amp;lt;&amp;lt; std::endl;
    std::cout &amp;lt;&amp;lt; &quot;sum = &quot; &amp;lt;&amp;lt; sum &amp;lt;&amp;lt; std::endl;
}
&lt;/code&gt;&lt;/pre&gt;

&lt;ul&gt;
&lt;li&gt;Without &lt;code&gt;std::sort(data, data + arraySize);&lt;/code&gt;, the code runs in 11.54 seconds.&lt;/li&gt;
&lt;li&gt;With the sorted data, the code runs in 1.93 seconds.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;Initially, I thought this might be just a language or compiler anomaly. So I tried it in Java.&lt;/p&gt;

&lt;pre class=&quot;lang-java prettyprint-override&quot;&gt;&lt;code&gt;import java.util.Arrays;
import java.util.Random;

public class Main
{
    public static void main(String[] args)
    {
        // Generate data
        int arraySize = 32768;
        int data[] = new int[arraySize];

        Random rnd = new Random(0);
        for (int c = 0; c &amp;lt; arraySize; ++c)
            data[c] = rnd.nextInt() % 256;

        // !!! With this, the next loop runs faster
        Arrays.sort(data);

        // Test
        long start = System.nanoTime();
        long sum = 0;

        for (int i = 0; i &amp;lt; 100000; ++i)
        {
            // Primary loop
            for (int c = 0; c &amp;lt; arraySize; ++c)
            {
                if (data[c] &amp;gt;= 128)
                    sum += data[c];
            }
        }

        System.out.println((System.nanoTime() - start) / 1000000000.0);
        System.out.println(&quot;sum = &quot; + sum);
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;With a somewhat similar but less extreme result.&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;My first thought was that sorting brings the data into the cache, but then I thought how silly that is because the array was just generated.&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;What is going on?&lt;/li&gt;
&lt;li&gt;Why is a sorted array faster to process than an unsorted array?&lt;/li&gt;
&lt;li&gt;The code is summing up some independent terms, and the order should not matter.&lt;/li&gt;
&lt;/ul&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (1, 1, 'Why is it faster to process a sorted array than an unsorted array?');
INSERT INTO activity (post_id, user_id, action) VALUES (1, 1, 'Create');
INSERT INTO tag (text) VALUES ('java');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 1);
INSERT INTO tag (text) VALUES ('c++');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 2);
INSERT INTO tag (text) VALUES ('performance');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 3);
INSERT INTO tag (text) VALUES ('optimization');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 4);
INSERT INTO tag (text) VALUES ('branch-prediction');
INSERT INTO questiontag (question_id, tag_id) VALUES (1, 5);

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 23654, 5753);
INSERT INTO postinstance (post_id, user_id, description) VALUES (2, 2, '&lt;p&gt;&lt;strong&gt;You are a victim of &lt;a href=&quot;//en.wikipedia.org/wiki/Branch_predictor&quot; rel=&quot;noreferrer&quot;&gt;branch prediction&lt;/a&gt; fail.&lt;/strong&gt;&lt;/p&gt;

&lt;hr&gt;

&lt;h2&gt;What is Branch Prediction?&lt;/h2&gt;

&lt;p&gt;Consider a railroad junction:&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;//commons.wikimedia.org/wiki/File:Entroncamento_do_Transpraia.JPG&quot; rel=&quot;noreferrer&quot;&gt;&lt;img src=&quot;https://i.stack.imgur.com/muxnt.jpg&quot; alt=&quot;Licensed Image&quot;&gt;&lt;/a&gt;
&lt;sub&gt;&lt;a href=&quot;//commons.wikimedia.org/wiki/File:Entroncamento_do_Transpraia.JPG&quot; rel=&quot;noreferrer&quot;&gt;Image&lt;/a&gt; by Mecanismo, via Wikimedia Commons. Used under the &lt;a href=&quot;//creativecommons.org/licenses/by-sa/3.0/deed.en&quot; rel=&quot;noreferrer&quot;&gt;CC-By-SA 3.0&lt;/a&gt; license.&lt;/sub&gt;&lt;/p&gt;

&lt;p&gt;Now for the sake of argument, suppose this is back in the 1800s - before long distance or radio communication.&lt;/p&gt;

&lt;p&gt;You are the operator of a junction and you hear a train coming. You have no idea which way it is supposed to go. You stop the train to ask the driver which direction they want. And then you set the switch appropriately.&lt;/p&gt;

&lt;p&gt;&lt;em&gt;Trains are heavy and have a lot of inertia. So they take forever to start up and slow down.&lt;/em&gt;&lt;/p&gt;

&lt;p&gt;Is there a better way? You guess which direction the train will go!&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;If you guessed right, it continues on.&lt;/li&gt;
&lt;li&gt;If you guessed wrong, the captain will stop, back up, and yell at you to flip the switch. Then it can restart down the other path.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;If you guess right every time&lt;/strong&gt;, the train will never have to stop.&lt;br&gt;
&lt;strong&gt;If you guess wrong too often&lt;/strong&gt;, the train will spend a lot of time stopping, backing up, and restarting.&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;&lt;strong&gt;Consider an if-statement:&lt;/strong&gt; At the processor level, it is a branch instruction:&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;https://i.stack.imgur.com/pyfwC.png&quot; alt=&quot;image2&quot;&gt;&lt;/p&gt;

&lt;p&gt;You are a processor and you see a branch. You have no idea which way it will go. What do you do? You halt execution and wait until the previous instructions are complete. Then you continue down the correct path.&lt;/p&gt;

&lt;p&gt;&lt;em&gt;Modern processors are complicated and have long pipelines. So they take forever to &quot;warm up&quot; and &quot;slow down&quot;.&lt;/em&gt;&lt;/p&gt;

&lt;p&gt;Is there a better way? You guess which direction the branch will go!&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;If you guessed right, you continue executing.&lt;/li&gt;
&lt;li&gt;If you guessed wrong, you need to flush the pipeline and roll back to the branch. Then you can restart down the other path.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;strong&gt;If you guess right every time&lt;/strong&gt;, the execution will never have to stop.&lt;br&gt;
&lt;strong&gt;If you guess wrong too often&lt;/strong&gt;, you spend a lot of time stalling, rolling back, and restarting.&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;This is branch prediction. I admit it&#x27;s not the best analogy since the train could just signal the direction with a flag. But in computers, the processor doesn&#x27;t know which direction a branch will go until the last moment.&lt;/p&gt;

&lt;p&gt;So how would you strategically guess to minimize the number of times that the train must back up and go down the other path? You look at the past history! If the train goes left 99% of the time, then you guess left. If it alternates, then you alternate your guesses. If it goes one way every 3 times, you guess the same...&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;In other words, you try to identify a pattern and follow it.&lt;/em&gt;&lt;/strong&gt; This is more or less how branch predictors work.&lt;/p&gt;

&lt;p&gt;Most applications have well-behaved branches. So modern branch predictors will typically achieve &gt;90% hit rates. But when faced with unpredictable branches with no recognizable patterns, branch predictors are virtually useless.&lt;/p&gt;

&lt;p&gt;Further reading: &lt;a href=&quot;//en.wikipedia.org/wiki/Branch_predictor&quot; rel=&quot;noreferrer&quot;&gt;&quot;Branch predictor&quot; article on Wikipedia&lt;/a&gt;.&lt;/p&gt;

&lt;hr&gt;

&lt;h2&gt;As hinted from above, the culprit is this if-statement:&lt;/h2&gt;

&lt;pre&gt;&lt;code&gt;if (data[c] &amp;gt;= 128)
    sum += data[c];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Notice that the data is evenly distributed between 0 and 255. 
When the data is sorted, roughly the first half of the iterations will not enter the if-statement. After that, they will all enter the if-statement.&lt;/p&gt;

&lt;p&gt;This is very friendly to the branch predictor since the branch consecutively goes the same direction many times.
Even a simple saturating counter will correctly predict the branch except for the few iterations after it switches direction.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Quick visualization:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;T = branch taken
N = branch not taken

data[] = 0, 1, 2, 3, 4, ... 126, 127, 128, 129, 130, ... 250, 251, 252, ...
branch = N  N  N  N  N  ...   N    N    T    T    T  ...   T    T    T  ...

       = NNNNNNNNNNNN ... NNNNNNNTTTTTTTTT ... TTTTTTTTTT  (easy to predict)
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;However, when the data is completely random, the branch predictor is rendered useless because it can&#x27;t predict random data.
Thus there will probably be around 50% misprediction. (no better than random guessing)&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;data[] = 226, 185, 125, 158, 198, 144, 217, 79, 202, 118,  14, 150, 177, 182, 133, ...
branch =   T,   T,   N,   T,   T,   T,   T,  N,   T,   N,   N,   T,   T,   T,   N  ...

       = TTNTTTTNTNNTTTN ...   (completely random - hard to predict)
&lt;/code&gt;&lt;/pre&gt;

&lt;hr&gt;

&lt;p&gt;&lt;strong&gt;So what can be done?&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;If the compiler isn&#x27;t able to optimize the branch into a conditional move, you can try some hacks if you are willing to sacrifice readability for performance.&lt;/p&gt;

&lt;p&gt;Replace:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (data[c] &amp;gt;= 128)
    sum += data[c];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;with:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;int t = (data[c] - 128) &amp;gt;&amp;gt; 31;
sum += ~t &amp;amp; data[c];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;This eliminates the branch and replaces it with some bitwise operations.&lt;/p&gt;

&lt;p&gt;&lt;sub&gt;(Note that this hack is not strictly equivalent to the original if-statement. But in this case, it&#x27;s valid for all the input values of &lt;code&gt;data[]&lt;/code&gt;.)&lt;/sub&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Benchmarks: Core i7 920 @ 3.5 GHz&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;C++ - Visual Studio 2010 - x64 Release&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;//  Branch - Random
seconds = 11.777

//  Branch - Sorted
seconds = 2.352

//  Branchless - Random
seconds = 2.564

//  Branchless - Sorted
seconds = 2.587
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Java - Netbeans 7.1.1 JDK 7 - x64&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;//  Branch - Random
seconds = 10.93293813

//  Branch - Sorted
seconds = 5.643797077

//  Branchless - Random
seconds = 3.113581453

//  Branchless - Sorted
seconds = 3.186068823
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Observations:&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;&lt;strong&gt;With the Branch:&lt;/strong&gt; There is a huge difference between the sorted and unsorted data.&lt;/li&gt;
&lt;li&gt;&lt;strong&gt;With the Hack:&lt;/strong&gt; There is no difference between sorted and unsorted data.&lt;/li&gt;
&lt;li&gt;In the C++ case, the hack is actually a tad slower than with the branch when the data is sorted.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;A general rule of thumb is to avoid data-dependent branching in critical loops. (such as in this example)&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;&lt;strong&gt;Update:&lt;/strong&gt;&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;&lt;p&gt;GCC 4.6.1 with &lt;code&gt;-O3&lt;/code&gt; or &lt;code&gt;-ftree-vectorize&lt;/code&gt; on x64 is able to generate a conditional move. So there is no difference between the sorted and unsorted data - both are fast.&lt;/p&gt;&lt;/li&gt;
&lt;li&gt;&lt;p&gt;VC++ 2010 is unable to generate conditional moves for this branch even under &lt;code&gt;/Ox&lt;/code&gt;.&lt;/p&gt;&lt;/li&gt;
&lt;li&gt;&lt;p&gt;Intel Compiler 11 does something miraculous. It &lt;a href=&quot;//en.wikipedia.org/wiki/Loop_interchange&quot; rel=&quot;noreferrer&quot;&gt;interchanges the two loops&lt;/a&gt;, thereby hoisting the unpredictable branch to the outer loop. So not only is it immune the mispredictions, it is also twice as fast as whatever VC++ and GCC can generate! In other words, ICC took advantage of the test-loop to defeat the benchmark...&lt;/p&gt;&lt;/li&gt;
&lt;li&gt;&lt;p&gt;If you give the Intel Compiler the branchless code, it just out-right vectorizes it... and is just as fast as with the branch (with the loop interchange).&lt;/p&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;This goes to show that even mature modern compilers can vary wildly in their ability to optimize code...&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (2, 1, 'True');
INSERT INTO activity (post_id, user_id, action) VALUES (2, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 356, 291);
INSERT INTO postinstance (post_id, user_id, description) VALUES (3, 4, '&lt;p&gt;An official answer would be from&lt;/p&gt;

&lt;ol&gt;
&lt;li&gt;&lt;a href=&quot;https://software.intel.com/en-us/articles/avoiding-the-cost-of-branch-misprediction&quot; rel=&quot;noreferrer&quot;&gt;Intel - Avoiding the Cost of Branch Misprediction&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://software.intel.com/en-us/articles/branch-and-loop-reorganization-to-prevent-mispredicts&quot; rel=&quot;noreferrer&quot;&gt;Intel - Branch and Loop Reorganization to Prevent Mispredicts&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;https://scholar.google.com/scholar?q=branch%20prediction%20computer%20architecture&amp;amp;hl=da&amp;amp;as_sdt=0&amp;amp;as_vis=1&amp;amp;oi=scholart&quot; rel=&quot;noreferrer&quot;&gt;Scientific papers - branch prediction computer architecture&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;Books: J.L. Hennessy, D.A. Patterson: Computer architecture: a quantitative approach&lt;/li&gt;
&lt;li&gt;Articles in scientific publications: T.Y. Yeh, Y.N. Patt made a lot of these on branch predictions.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;You can also see from this lovely &lt;a href=&quot;https://en.wikipedia.org/wiki/Branch_predictor#/media/File:Branch_prediction_2bit_saturating_counter-dia.svg&quot; rel=&quot;noreferrer&quot;&gt;diagram&lt;/a&gt; why the branch predictor gets confused.&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;https://i.stack.imgur.com/pBMV2.png&quot; rel=&quot;noreferrer&quot;&gt;&lt;img src=&quot;https://i.stack.imgur.com/pBMV2.png&quot; alt=&quot;2-bit state diagram&quot;&gt;&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;Each element in the original code is a random value&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;data[c] = std::rand() % 256;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;so the predictor will change sides as the &lt;code&gt;std::rand()&lt;/code&gt; blow.&lt;/p&gt;

&lt;p&gt;On the other hand, once it&#x27;s sorted, the predictor will first move into a state of strongly not taken and when the values change to the high value the predictor will in three runs through change all the way from strongly not taken to strongly taken.&lt;/p&gt;

&lt;hr&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (3, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (3, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 30, 18);
INSERT INTO postinstance (post_id, user_id, description) VALUES (4, 2, '&lt;p&gt;This question has already been answered excellently many times over. Still I&#x27;d like to draw the group&#x27;s attention to yet another interesting analysis.&lt;/p&gt;

&lt;p&gt;Recently this example (modified very slightly) was also used as a way to demonstrate how a piece of code can be profiled within the program itself on Windows. Along the way, the author also shows how to use the results to determine where the code is spending most of its time in both the sorted &amp;amp; unsorted case. Finally the piece also shows how to use a little known feature of the HAL (Hardware Abstraction Layer) to determine just how much branch misprediction is happening in the unsorted case.&lt;/p&gt;

&lt;p&gt;The link is here:
&lt;a href=&quot;http://www.geoffchappell.com/studies/windows/km/ntoskrnl/api/ex/profile/demo.htm&quot;&gt;http://www.geoffchappell.com/studies/windows/km/ntoskrnl/api/ex/profile/demo.htm&lt;/a&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (4, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (4, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2299, 1018);
INSERT INTO postinstance (post_id, user_id, description) VALUES (5, 5, '&lt;p&gt;The reason why performance improves drastically when the data is sorted is that the branch prediction penalty is removed, as explained beautifully in &lt;a href=&quot;http://stackoverflow.com/users/922184/mysticial&quot;&gt;Mysticial&lt;/a&gt;&#x27;s answer.&lt;/p&gt;

&lt;p&gt;Now, if we look at the code&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (data[c] &amp;gt;= 128)
    sum += data[c];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;we can find that the meaning of this particular &lt;code&gt;if... else...&lt;/code&gt; branch is to add something when a condition is satisfied. This type of branch can be easily transformed into a &lt;strong&gt;conditional move&lt;/strong&gt; statement, which would be compiled into a conditional move instruction: &lt;code&gt;cmovl&lt;/code&gt;, in an &lt;code&gt;x86&lt;/code&gt; system. The branch and thus the potential branch prediction penalty is removed.&lt;/p&gt;

&lt;p&gt;In &lt;code&gt;C&lt;/code&gt;, thus &lt;code&gt;C++&lt;/code&gt;, the statement, which would compile directly (without any optimization) into the conditional move instruction in &lt;code&gt;x86&lt;/code&gt;, is the ternary operator &lt;code&gt;... ? ... : ...&lt;/code&gt;. So we rewrite the above statement into an equivalent one:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;sum += data[c] &amp;gt;=128 ? data[c] : 0;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;While maintaining readability, we can check the speedup factor.&lt;/p&gt;

&lt;p&gt;On an Intel &lt;a href=&quot;http://en.wikipedia.org/wiki/Intel_Core#Core_i7&quot; rel=&quot;noreferrer&quot;&gt;Core i7&lt;/a&gt;-2600K @ 3.4&amp;nbsp;GHz and Visual Studio 2010 Release Mode, the benchmark is (format copied from Mysticial):&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;x86&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;//  Branch - Random
seconds = 8.885

//  Branch - Sorted
seconds = 1.528

//  Branchless - Random
seconds = 3.716

//  Branchless - Sorted
seconds = 3.71
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;strong&gt;x64&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;//  Branch - Random
seconds = 11.302

//  Branch - Sorted
 seconds = 1.830

//  Branchless - Random
seconds = 2.736

//  Branchless - Sorted
seconds = 2.737
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;The result is robust in multiple tests. We get a great speedup when the branch result is unpredictable, but we suffer a little bit when it is predictable. In fact, when using a conditional move, the performance is the same regardless of the data pattern.&lt;/p&gt;

&lt;p&gt;Now let&#x27;s look more closely by investigating the &lt;code&gt;x86&lt;/code&gt; assembly they generate. For simplicity, we use two functions &lt;code&gt;max1&lt;/code&gt; and &lt;code&gt;max2&lt;/code&gt;.&lt;/p&gt;

&lt;p&gt;&lt;code&gt;max1&lt;/code&gt; uses the conditional branch &lt;code&gt;if... else ...&lt;/code&gt;:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;int max1(int a, int b) {
    if (a &amp;gt; b)
        return a;
    else
        return b;
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;code&gt;max2&lt;/code&gt; uses the ternary operator &lt;code&gt;... ? ... : ...&lt;/code&gt;:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;int max2(int a, int b) {
    return a &amp;gt; b ? a : b;
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;On a x86-64 machine, &lt;code&gt;GCC -S&lt;/code&gt; generates the assembly below.&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;:max1
    movl    %edi, -4(%rbp)
    movl    %esi, -8(%rbp)
    movl    -4(%rbp), %eax
    cmpl    -8(%rbp), %eax
    jle     .L2
    movl    -4(%rbp), %eax
    movl    %eax, -12(%rbp)
    jmp     .L4
.L2:
    movl    -8(%rbp), %eax
    movl    %eax, -12(%rbp)
.L4:
    movl    -12(%rbp), %eax
    leave
    ret

:max2
    movl    %edi, -4(%rbp)
    movl    %esi, -8(%rbp)
    movl    -4(%rbp), %eax
    cmpl    %eax, -8(%rbp)
    cmovge  -8(%rbp), %eax
    leave
    ret
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;code&gt;max2&lt;/code&gt; uses much less code due to the usage of instruction &lt;code&gt;cmovge&lt;/code&gt;. But the real gain is that &lt;code&gt;max2&lt;/code&gt; does not involve branch jumps, &lt;code&gt;jmp&lt;/code&gt;, which would have a significant performance penalty if the predicted result is not right.&lt;/p&gt;

&lt;p&gt;So why does a conditional move perform better?&lt;/p&gt;

&lt;p&gt;In a typical &lt;code&gt;x86&lt;/code&gt; processor, the execution of an instruction is divided into several stages. Roughly, we have different hardware to deal with different stages. So we do not have to wait for one instruction to finish to start a new one. This is called &lt;strong&gt;&lt;a href=&quot;http://en.wikipedia.org/wiki/Pipeline_%28computing%29&quot; rel=&quot;noreferrer&quot;&gt;pipelining&lt;/a&gt;&lt;/strong&gt;.&lt;/p&gt;

&lt;p&gt;In a branch case, the following instruction is determined by the preceding one, so we cannot do pipelining. We have to either wait or predict.&lt;/p&gt;

&lt;p&gt;In a conditional move case, the execution conditional move instruction is divided into several stages, but the earlier stages like &lt;code&gt;Fetch&lt;/code&gt; and &lt;code&gt;Decode&lt;/code&gt; does not depend on the result of the previous instruction; only latter stages need the result. Thus, we wait a fraction of one instruction&#x27;s execution time. This is why the conditional move version is slower than the branch when prediction is easy.&lt;/p&gt;

&lt;p&gt;The book &lt;em&gt;&lt;a href=&quot;http://rads.stackoverflow.com/amzn/click/0136108040&quot; rel=&quot;noreferrer&quot;&gt;Computer Systems: A Programmer&#x27;s Perspective, second edition&lt;/a&gt;&lt;/em&gt; explains this in detail. You can check Section 3.6.6 for &lt;em&gt;Conditional Move Instructions&lt;/em&gt;, entire Chapter 4 for &lt;em&gt;Processor Architecture&lt;/em&gt;, and Section 5.11.2 for a special treatment for &lt;em&gt;Branch Prediction and Misprediction Penalties&lt;/em&gt;.&lt;/p&gt;

&lt;p&gt;Sometimes, some modern compilers can optimize our code to assembly with better performance, sometimes some compilers can&#x27;t (the code in question is using Visual Studio&#x27;s native compiler). Knowing the performance difference between branch and conditional move when unpredictable can help us write code with better performance when the scenario gets so complex that the compiler can not optimize them automatically.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (5, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (5, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 416, 226);
INSERT INTO postinstance (post_id, user_id, description) VALUES (6, 3, '&lt;p&gt;The above behavior is happening because of Branch prediction.&lt;/p&gt;

&lt;p&gt;To understand branch prediction one must first understand &lt;strong&gt;Instruction Pipeline&lt;/strong&gt;:&lt;/p&gt;

&lt;p&gt;Any instruction is broken into sequence of steps so that different steps can be executed concurrently in parallel. This technique is known as instruction pipeline and this is used to increase throughput in modern processors. To understand this better please see this &lt;a href=&quot;https://en.wikipedia.org/wiki/Pipeline_(computing)#Concept_and_motivation&quot; rel=&quot;noreferrer&quot;&gt;example on Wikipedia&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;Generally modern processors have quite long pipelines, but for ease let&#x27;s consider these 4 steps only.&lt;/p&gt;

&lt;ol&gt;  
  &lt;li&gt;IF -- Fetch the instruction from memory 
  &lt;li&gt;ID -- Decode the instruction
  &lt;li&gt;EX -- Execute the instruction 
  &lt;li&gt;WB -- Write back to CPU register
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;4-stage pipeline in general for 2 instructions.&lt;/em&gt;&lt;/strong&gt;
&lt;img src=&quot;https://i.stack.imgur.com/PqBBR.png&quot; alt=&quot;4-stage pipeline in general&quot;&gt;&lt;/p&gt;

&lt;p&gt;Moving back to the above question let&#x27;s consider the following instructions:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;                        A) if (data[c] &amp;gt;= 128)
                                /\
                               /  \
                              /    \
                        true /      \ false
                            /        \
                           /          \
                          /            \
                         /              \
              B) sum += data[c];          C) for loop or print().
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Without branch prediction the following would occur:&lt;/p&gt;

&lt;p&gt;To execute instruction B or instruction C the processor will have to wait till the instruction A doesn&#x27;t reach till EX stage in the pipeline, as the decision to go to instruction B or instruction C depends on the result of instruction A. So the pipeline will look like this.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;when if condition returns true:&lt;/em&gt;&lt;/strong&gt;
&lt;img src=&quot;https://i.stack.imgur.com/0H4gP.png&quot; alt=&quot;enter image description here&quot;&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;When if condition returns false:&lt;/em&gt;&lt;/strong&gt;
&lt;img src=&quot;https://i.stack.imgur.com/APpca.png&quot; alt=&quot;enter image description here&quot;&gt;&lt;/p&gt;

&lt;p&gt;As a result of waiting for the result of instruction A, the total CPU cycles spent in the above case (without branch prediction; for both true and false) is 7.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;So what is branch prediction?&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;Branch predictor will tries to guess which way a branch (an if-then-else structure) will go before this is known for sure. It will not wait for the instruction A to reach the EX stage of the pipeline, but it will guess the decision and go onto that instruction (B or C in case of our example).&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;In case of a correct guess, the pipeline looks something like this:&lt;/em&gt;&lt;/strong&gt;
&lt;img src=&quot;https://i.stack.imgur.com/ZYUbs.png&quot; alt=&quot;enter image description here&quot;&gt;&lt;/p&gt;

&lt;p&gt;If it is later detected that the guess was wrong then the partially executed instructions are discarded and the pipeline starts over with the correct branch, incurring a delay. 
The time that is wasted in case of a branch misprediction is equal to the number of stages in the pipeline from the fetch stage to the execute stage. Modern microprocessors tend to have quite long pipelines so that the misprediction delay is between 10 and 20 clock cycles. The longer the pipeline the greater the need for a good &lt;a href=&quot;https://en.wikipedia.org/wiki/Branch_predictor&quot; rel=&quot;noreferrer&quot;&gt;branch predictor&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;In the OP&#x27;s code, the first time when the conditional, the branch predictor does not have any information to base up prediction, so first time it will randomly choose the next instruction. Later in the for loop it can base the prediction on the history. 
For an array sorted in ascending order, there are three possibilities:&lt;/p&gt;

&lt;ol&gt;
&lt;li&gt; All the elements are less than 128
&lt;li&gt; All the elements are greater than 128
&lt;li&gt; Some starting new elements are less than 128 and later it become greater than 128
&lt;/ol&gt;

&lt;p&gt;Let us assume that the predictor will always assume the true branch on the first run.&lt;/p&gt;

&lt;p&gt;So in the first case it will always take the true branch since historically all its predictions are correct.
In the 2nd case, initially it will predict wrong, but after a few iterations it will predict correctly.
In the 3rd case it will initially predict correctly till the elements are less than 128. After which it will fail for some time and the correct itself when it see branch prediction failure in history. &lt;/p&gt;

&lt;p&gt;In all these cases the failure will be too less in number and as a result only few times it will need to discard the partially executed instructions and start over with the correct branch, resulting in less CPU cycles. &lt;/p&gt;

&lt;p&gt;But in case of random unsorted array, the prediction will need to discard the partially executed instructions and start over with the correct branch most of the time and result in more CPU cycles compared to the sorted array.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (6, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (6, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 353, 260);
INSERT INTO postinstance (post_id, user_id, description) VALUES (7, 4, '&lt;p&gt;In the same line (I think this was not highlighted by any answer) it&#x27;s good to mention that sometimes (specially in software where the performance matters—like in the Linux kernel) you can find some if statements like the following:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (likely( everything_is_ok ))
{
    /* Do something */
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;or similarly:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (unlikely(very_improbable_condition))
{
    /* Do something */    
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Both &lt;code&gt;likely()&lt;/code&gt; and &lt;code&gt;unlikely()&lt;/code&gt; are in fact macros that are defined by using something like the GCC&#x27;s &lt;code&gt;__builtin_expect&lt;/code&gt; to help the compiler insert prediction code to favour the condition taking into account the information provided by the user. GCC supports other builtins that could change the behavior of the running program or emit low level instructions like clearing the cache, etc. See &lt;a href=&quot;https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html&quot; rel=&quot;noreferrer&quot;&gt;this documentation&lt;/a&gt; that goes through the available GCC&#x27;s builtins.&lt;/p&gt;

&lt;p&gt;Normally this kind of optimizations are mainly found in hard-real time applications or embedded systems where execution time matters and it&#x27;s critical. For example, if you are checking for some error condition that only happens 1/10000000 times, then why not inform the compiler about this? This way, by default, the branch prediction would assume that the condition is false.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (7, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (7, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2897, 1136);
INSERT INTO postinstance (post_id, user_id, description) VALUES (8, 3, '&lt;p&gt;&lt;strong&gt;Branch prediction.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;With a sorted array, the condition &lt;code&gt;data[c] &amp;gt;= 128&lt;/code&gt; is first &lt;code&gt;false&lt;/code&gt; for a streak of values, then becomes &lt;code&gt;true&lt;/code&gt; for all later values. That&#x27;s easy to predict. With an unsorted array, you pay for the branching cost.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (8, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (8, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 341, 41);
INSERT INTO postinstance (post_id, user_id, description) VALUES (9, 5, '&lt;p&gt;Frequently used Boolean operations in C++ produce many branches in compiled program. If these branches are inside loops and are hard to predict they can slow down execution significantly. Boolean variables are stored as 8-bit integers with the value &lt;code&gt;0&lt;/code&gt; for &lt;code&gt;false&lt;/code&gt; and &lt;code&gt;1&lt;/code&gt; for &lt;code&gt;true&lt;/code&gt;.&lt;/p&gt;

&lt;p&gt;Boolean variables are overdetermined in the sense that all operators that have Boolean variables as input check if the inputs have any other value than &lt;code&gt;0&lt;/code&gt; or &lt;code&gt;1&lt;/code&gt;, but operators that have Booleans as output can produce no other value than &lt;code&gt;0&lt;/code&gt; or &lt;code&gt;1&lt;/code&gt;. This makes operations with Boolean variables as input less efficient than necessary.
Consider example:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;bool a, b, c, d;
c = a &amp;amp;&amp;amp; b;
d = a || b;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;This is typically implemented by the compiler in the following way:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;bool a, b, c, d;
if (a != 0) {
    if (b != 0) {
        c = 1;
    }
    else {
        goto CFALSE;
    }
}
else {
    CFALSE:
    c = 0;
}
if (a == 0) {
    if (b == 0) {
        d = 0;
    }
    else {
        goto DTRUE;
    }
}
else {
    DTRUE:
    d = 1;
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;This code is far from optimal. The branches may take a long time in case of mispredictions. The Boolean operations can be made much more efficient if it is known with certainty that the operands have no other values than &lt;code&gt;0&lt;/code&gt; and &lt;code&gt;1&lt;/code&gt;. The reason why the compiler does not make such an assumption is that the variables might have other values if they are uninitialized or come from unknown sources. The above code can be optimized if &lt;code&gt;a&lt;/code&gt; and &lt;code&gt;b&lt;/code&gt; have been initialized to valid values or if they come from operators that produce Boolean output. The optimized code looks like this:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;char a = 0, b = 1, c, d;
c = a &amp;amp; b;
d = a | b;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;code&gt;char&lt;/code&gt; is used instead of &lt;code&gt;bool&lt;/code&gt; in order to make it possible to use the bitwise operators (&lt;code&gt;&amp;amp;&lt;/code&gt; and &lt;code&gt;|&lt;/code&gt;) instead of the Boolean operators (&lt;code&gt;&amp;amp;&amp;amp;&lt;/code&gt; and &lt;code&gt;||&lt;/code&gt;). The bitwise operators are single instructions that take only one clock cycle. The OR operator (&lt;code&gt;|&lt;/code&gt;) works even if &lt;code&gt;a&lt;/code&gt; and &lt;code&gt;b&lt;/code&gt; have other values than &lt;code&gt;0&lt;/code&gt; or &lt;code&gt;1&lt;/code&gt;. The AND operator (&lt;code&gt;&amp;amp;&lt;/code&gt;) and the EXCLUSIVE OR operator (&lt;code&gt;^&lt;/code&gt;) may give inconsistent results if the operands have other values than &lt;code&gt;0&lt;/code&gt; and &lt;code&gt;1&lt;/code&gt;.&lt;/p&gt;

&lt;p&gt;&lt;code&gt;~&lt;/code&gt; can not be used for NOT. Instead, you can make a Boolean NOT on a variable which is known to be &lt;code&gt;0&lt;/code&gt; or &lt;code&gt;1&lt;/code&gt; by XOR&#x27;ing it with &lt;code&gt;1&lt;/code&gt;:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;bool a, b;
b = !a;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;can be optimized to:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;char a = 0, b;
b = a ^ 1;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;code&gt;a &amp;amp;&amp;amp; b&lt;/code&gt; cannot be replaced with &lt;code&gt;a &amp;amp; b&lt;/code&gt; if &lt;code&gt;b&lt;/code&gt; is an expression that should not be evaluated if &lt;code&gt;a&lt;/code&gt; is &lt;code&gt;false&lt;/code&gt; ( &lt;code&gt;&amp;amp;&amp;amp;&lt;/code&gt; will not evaluate &lt;code&gt;b&lt;/code&gt;, &lt;code&gt;&amp;amp;&lt;/code&gt; will). Likewise, &lt;code&gt;a || b&lt;/code&gt; can not be replaced with &lt;code&gt;a | b&lt;/code&gt; if &lt;code&gt;b&lt;/code&gt; is an expression that should not be evaluated if &lt;code&gt;a&lt;/code&gt; is &lt;code&gt;true&lt;/code&gt;.&lt;/p&gt;

&lt;p&gt;Using bitwise operators is more advantageous if the operands are variables than if the operands are comparisons:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;bool a; double x, y, z;
a = x &amp;gt; y &amp;amp;&amp;amp; z &amp;lt; 5.0;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;is optimal in most cases (unless you expect the &lt;code&gt;&amp;amp;&amp;amp;&lt;/code&gt; expression to generate many branch mispredictions).&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (9, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (9, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 703, 492);
INSERT INTO postinstance (post_id, user_id, description) VALUES (10, 2, '&lt;p&gt;One way to avoid branch prediction errors is to build a lookup table, and index it using the data.  Stefan de Bruijn discussed that in his answer.&lt;/p&gt;

&lt;p&gt;But in this case, we know values are in the range [0, 255] and we only care about values &gt;= 128.  That means we can easily extract a single bit that will tell us whether we want a value or not: by shifting the data to the right 7 bits, we are left with a 0 bit or a 1 bit, and we only want to add the value when we have a 1 bit.  Let&#x27;s call this bit the &quot;decision bit&quot;.&lt;/p&gt;

&lt;p&gt;By using the 0/1 value of the decision bit as an index into an array, we can make code that will be equally fast whether the data is sorted or not sorted.  Our code will always add a value, but when the decision bit is 0, we will add the value somewhere we don&#x27;t care about.  Here&#x27;s the code:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;// Test
clock_t start = clock();
long long a[] = {0, 0};
long long sum;

for (unsigned i = 0; i &amp;lt; 100000; ++i)
{
    // Primary loop
    for (unsigned c = 0; c &amp;lt; arraySize; ++c)
    {
        int j = (data[c] &amp;gt;&amp;gt; 7);
        a[j] += data[c];
    }
}

double elapsedTime = static_cast&amp;lt;double&amp;gt;(clock() - start) / CLOCKS_PER_SEC;
sum = a[1];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;This code wastes half of the adds, but never has a branch prediction failure.  It&#x27;s tremendously faster on random data than the version with an actual if statement.&lt;/p&gt;

&lt;p&gt;But in my testing, an explicit lookup table was slightly faster than this, probably because indexing into a lookup table was slightly faster than bit shifting.  This shows how my code sets up and uses the lookup table (unimaginatively called &lt;code&gt;lut&lt;/code&gt; for &quot;LookUp Table&quot; in the code).  Here&#x27;s the C++ code:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;// declare and then fill in the lookup table
int lut[256];
for (unsigned c = 0; c &amp;lt; 256; ++c)
    lut[c] = (c &amp;gt;= 128) ? c : 0;

// use the lookup table after it is built
for (unsigned i = 0; i &amp;lt; 100000; ++i)
{
    // Primary loop
    for (unsigned c = 0; c &amp;lt; arraySize; ++c)
    {
        sum += lut[data[c]];
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;In this case the lookup table was only 256 bytes, so it fit nicely in cache and all was fast.  This technique wouldn&#x27;t work well if the data was 24-bit values and we only wanted half of them... the lookup table would be far too big to be practical.  On the other hand, we can combine the two techniques shown above: first shift the bits over, then index a lookup table.  For a 24-bit value that we only want the top half value, we could potentially shift the data right by 12 bits, and be left with a 12-bit value for a table index.  A 12-bit table index implies a table of 4096 values, which might be practical.&lt;/p&gt;

&lt;p&gt;EDIT: One thing I forgot to put in.&lt;/p&gt;

&lt;p&gt;The technique of indexing into an array, instead of using an &lt;code&gt;if&lt;/code&gt; statement, can be used for deciding which pointer to use.  I saw a library that implemented binary trees, and instead of having two named pointers (&lt;code&gt;pLeft&lt;/code&gt; and &lt;code&gt;pRight&lt;/code&gt; or whatever) had a length-2 array of pointers, and used the &quot;decision bit&quot; technique to decide which one to follow.  For example, instead of:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (x &amp;lt; node-&amp;gt;value)
    node = node-&amp;gt;pLeft;
else
    node = node-&amp;gt;pRight;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;this library would do something like:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;i = (x &amp;lt; node-&amp;gt;value);
node = node-&amp;gt;link[i];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Here&#x27;s a link to this code: &lt;a href=&quot;http://www.eternallyconfuzzled.com/tuts/datastructures/jsw_tut_rbtree.aspx&quot;&gt;Red Black Trees&lt;/a&gt;, &lt;em&gt;Eternally Confuzzled&lt;/em&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (10, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (10, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 652, 541);
INSERT INTO postinstance (post_id, user_id, description) VALUES (11, 2, '&lt;p&gt;In the sorted case, you can do better than relying on successful branch prediction or any branchless comparison trick: completely remove the branch.&lt;/p&gt;

&lt;p&gt;Indeed, the array is partitioned in a contiguous zone with &lt;code&gt;data &amp;lt; 128&lt;/code&gt; and another with &lt;code&gt;data &amp;gt;= 128&lt;/code&gt;. So you should find the partition point with a dichotomic search (using &lt;code&gt;Lg(arraySize) = 15&lt;/code&gt; comparisons), then do a straight accumulation from that point.&lt;/p&gt;

&lt;p&gt;Something like (unchecked)&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;int i= 0, j, k= arraySize;
while (i &amp;lt; k)
{
  j= (i + k) &amp;gt;&amp;gt; 1;
  if (data[j] &amp;gt;= 128)
    k= j;
  else
    i= j;
}
sum= 0;
for (; i &amp;lt; arraySize; i++)
  sum+= data[i];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;or, slightly more obfuscated&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;int i, k, j= (i + k) &amp;gt;&amp;gt; 1;
for (i= 0, k= arraySize; i &amp;lt; k; (data[j] &amp;gt;= 128 ? k : i)= j)
  j= (i + k) &amp;gt;&amp;gt; 1;
for (sum= 0; i &amp;lt; arraySize; i++)
  sum+= data[i];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;A yet faster approach, that gives an &lt;strong&gt;approximate&lt;/strong&gt; solution for both sorted or unsorted is: &lt;code&gt;sum= 3137536;&lt;/code&gt; (assuming a truly uniform distribution, 16384 samples with expected value 191.5) &lt;strong&gt;:-)&lt;/strong&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (11, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (11, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 838, 150);
INSERT INTO postinstance (post_id, user_id, description) VALUES (12, 3, '&lt;p&gt;Just read up on the thread and I feel an answer is missing. A common way to eliminate branch prediction that I&#x27;ve found to work particularly good in managed languages is a table lookup instead of using a branch. (although I haven&#x27;t tested it in this case)&lt;/p&gt;

&lt;p&gt;This approach works in general if:&lt;/p&gt;

&lt;ol&gt;
&lt;li&gt;It&#x27;s a small table and is likely to be cached in the processor&lt;/li&gt;
&lt;li&gt;You are running things in a quite tight loop and/or the processor can pre-load the data&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;Background and why&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;Pfew, so what the hell is that supposed to mean?&lt;/p&gt;

&lt;p&gt;From a processor perspective, your memory is slow. To compensate for the difference in speed, they build in a couple of caches in your processor (L1/L2 cache) that compensate for that. So imagine that you&#x27;re doing your nice calculations and figure out that you need a piece of memory. The processor will get his &#x27;load&#x27; operation and loads the piece of memory into cache - and then uses the cache to do the rest of the calculations. Because memory is relatively slow, this &#x27;load&#x27; will slow down your program. &lt;/p&gt;

&lt;p&gt;Like branch prediction, this was optimized in the Pentium processors: the processor predicts that it needs to load a piece of data and attempts to load that into the cache before the operation actually hits the cache. As we&#x27;ve already seen, branch prediction sometimes goes horribly wrong -- in the worst case scenario you need to go back and actually wait for a memory load, which will take forever (&lt;strong&gt;in other words: failing branch prediction is bad, a memory load after a branch prediction fail is just horrible!&lt;/strong&gt;).&lt;/p&gt;

&lt;p&gt;Fortunately for us, if the memory access pattern is predictable, the processor will load it in its fast cache and all is well.&lt;/p&gt;

&lt;p&gt;First thing we need to know is what is &lt;em&gt;small&lt;/em&gt;? While smaller is generally better, a rule of thumb is to stick to lookup tables that are &amp;lt;=4096 bytes in size. As an upper limit: if your lookup table is larger than 64K it&#x27;s probably worth reconsidering.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Constructing a table&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;So we&#x27;ve figured out that we can create a small table. Next thing to do is get a lookup function in place. Lookup functions are usually small functions that use a couple of basic integer operations (and, or, xor, shift, add, remove and perhaps a multiply). What you want is to have your input translated by the lookup function to some kind of &#x27;unique key&#x27; in your table, which then simply gives you the answer of all the work you wanted it to do.&lt;/p&gt;

&lt;p&gt;In this case: &gt;=128 means we can keep the value, &amp;lt;128 means we get rid of it. The easiest way to do that is by using an &#x27;AND&#x27;: if we keep it, we AND it with 7FFFFFFF ; if we want to get rid of it, we AND it with 0. Notice also that 128 is a power of 2 -- so we can go ahead and make a table of 32768/128 integers and fill it with one zero and a lot of 7FFFFFFFF&#x27;s.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Managed languages&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;You might wonder why this works well in managed languages. After all, managed languages check the boundaries of the arrays with a branch to ensure you don&#x27;t mess up...&lt;/p&gt;

&lt;p&gt;Well, not exactly... :-)&lt;/p&gt;

&lt;p&gt;There has been quite some work on eliminating this branch for managed languages. For example:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (int i=0; i&amp;lt;array.Length; ++i)
   // use array[i]
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;in this case it&#x27;s obvious to the compiler that the boundary condition will never hit. At least the Microsoft JIT compiler (but I expect Java does similar things) will notice this and remove the check all together. WOW - that means no branch. Similarly, it will deal with other obvious cases.&lt;/p&gt;

&lt;p&gt;If you run into trouble with lookups on managed languages - the key is to add a &lt;code&gt;&amp;amp; 0x[something]FFF&lt;/code&gt; to your lookup function to make the boundary check predictable - and watch it going faster.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;The result for this case&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;// generate data
int arraySize = 32768;
int[] data = new int[arraySize];

Random rnd = new Random(0);
for (int c = 0; c &amp;lt; arraySize; ++c)
    data[c] = rnd.Next(256);


// Too keep the spirit of the code in-tact I&#x27;ll make a separate lookup table
// (I assume we cannot modify &#x27;data&#x27; or the number of loops)
int[] lookup = new int[256];

for (int c = 0; c &amp;lt; 256; ++c)
    lookup[c] = (c &amp;gt;= 128) ? c : 0;

// test
DateTime startTime = System.DateTime.Now;
long sum = 0;

for (int i = 0; i &amp;lt; 100000; ++i)
{
    // primary loop
    for (int j = 0; j &amp;lt; arraySize; ++j)
    {
        // here you basically want to use simple operations - so no 
        // random branches, but things like &amp;amp;, |, *, -, +, etc are fine.
        sum += lookup[data[j]];
    }
}

DateTime endTime = System.DateTime.Now;
Console.WriteLine(endTime - startTime);
Console.WriteLine(&quot;sum = &quot; + sum);

Console.ReadLine();
&lt;/code&gt;&lt;/pre&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (12, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (12, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 757, 117);
INSERT INTO postinstance (post_id, user_id, description) VALUES (13, 1, '&lt;p&gt;As data is distributed between 0 and 255 when array is sorted, around first half of the iterations will not enter the if-statement (if statement shared below).&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;if (data[c] &amp;gt;= 128)
    sum += data[c];
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Question is what make the above statement not execute in certain case as in case of sorted data? Here comes the &quot;Branch predictor&quot; a branch predictor is a digital circuit that tries to guess which way a branch (e.g. an if-then-else structure) will go before this is known for sure. The purpose of the branch predictor is to improve the flow in the instruction pipeline. Branch predictors play a critical role in achieving high effective performance!&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Lets do some bench marking to understand it better&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;The performance of an if-statement depends on whether its condition has a predictable pattern. If the condition is always true or always false, the branch prediction logic in the processor will pick up the pattern. On the other hand, if the pattern is unpredictable, the if-statement will be much more expensive.&lt;/p&gt;

&lt;p&gt;Let’s measure the performance of this loop with different conditions:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (int i = 0; i &amp;lt; max; i++) if (condition) sum++;
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Here are the timings of the loop with different True-False patterns:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;Condition           Pattern              Time (ms)

(i &amp;amp; 0×80000000) == 0   T repeated        322

(i &amp;amp; 0xffffffff) == 0   F repeated        276

(i &amp;amp; 1) == 0            TF alternating    760

(i &amp;amp; 3) == 0            TFFFTFFF…         513

(i &amp;amp; 2) == 0            TTFFTTFF…         1675

(i &amp;amp; 4) == 0            TTTTFFFFTTTTFFFF… 1275

(i &amp;amp; 8) == 0            8T 8F 8T 8F …     752

(i &amp;amp; 16) == 0           16T 16F 16T 16F … 490
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;A “&lt;strong&gt;bad&lt;/strong&gt;” true-false pattern can make an if-statement up to six times slower than a “&lt;strong&gt;good&lt;/strong&gt;” pattern! Of course, which pattern is good and which is bad depends on the exact instructions generated by the compiler and on the specific processor.&lt;/p&gt;

&lt;p&gt;So there is no doubt about impact of branch prediction on performance!&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (13, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (13, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1313, 1207);
INSERT INTO postinstance (post_id, user_id, description) VALUES (14, 4, '&lt;p&gt;No doubt some of us would be interested in ways of identifying code that is problematic for the CPU&#x27;s branch-predictor. The Valgrind tool &lt;code&gt;cachegrind&lt;/code&gt; has a branch-predictor simulator, enabled by using the &lt;code&gt;--branch-sim=yes&lt;/code&gt; flag. Running it over the examples in this question, with the number of outer loops reduced to 10000 and compiled with &lt;code&gt;g++&lt;/code&gt;, gives these results:&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;==32551== Branches:        656,645,130  (  656,609,208 cond +    35,922 ind)
==32551== Mispredicts:         169,556  (      169,095 cond +       461 ind)
==32551== Mispred rate:            0.0% (          0.0%     +       1.2%   )
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;strong&gt;Unsorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;==32555== Branches:        655,996,082  (  655,960,160 cond +  35,922 ind)
==32555== Mispredicts:     164,073,152  (  164,072,692 cond +     460 ind)
==32555== Mispred rate:           25.0% (         25.0%     +     1.2%   )
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Drilling down into the line-by-line output produced by &lt;code&gt;cg_annotate&lt;/code&gt; we see for the loop in question:&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Sorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;          Bc    Bcm Bi Bim
      10,001      4  0   0      for (unsigned i = 0; i &amp;lt; 10000; ++i)
           .      .  .   .      {
           .      .  .   .          // primary loop
 327,690,000 10,016  0   0          for (unsigned c = 0; c &amp;lt; arraySize; ++c)
           .      .  .   .          {
 327,680,000 10,006  0   0              if (data[c] &amp;gt;= 128)
           0      0  0   0                  sum += data[c];
           .      .  .   .          }
           .      .  .   .      }
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;strong&gt;Unsorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;          Bc         Bcm Bi Bim
      10,001           4  0   0      for (unsigned i = 0; i &amp;lt; 10000; ++i)
           .           .  .   .      {
           .           .  .   .          // primary loop
 327,690,000      10,038  0   0          for (unsigned c = 0; c &amp;lt; arraySize; ++c)
           .           .  .   .          {
 327,680,000 164,050,007  0   0              if (data[c] &amp;gt;= 128)
           0           0  0   0                  sum += data[c];
           .           .  .   .          }
           .           .  .   .      }
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;This lets you easily identify the problematic line - in the unsorted version the &lt;code&gt;if (data[c] &amp;gt;= 128)&lt;/code&gt; line is causing 164,050,007 mispredicted conditional branches (&lt;code&gt;Bcm&lt;/code&gt;) under cachegrind&#x27;s branch-predictor model, whereas it&#x27;s only causing 10,006 in the sorted version.&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;Alternatively, on Linux you can use the performance counters subsystem to accomplish the same task, but with native performance using CPU counters.&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;perf stat ./sumtest_sorted
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;strong&gt;Sorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt; Performance counter stats for &#x27;./sumtest_sorted&#x27;:

  11808.095776 task-clock                #    0.998 CPUs utilized          
         1,062 context-switches          #    0.090 K/sec                  
            14 CPU-migrations            #    0.001 K/sec                  
           337 page-faults               #    0.029 K/sec                  
26,487,882,764 cycles                    #    2.243 GHz                    
41,025,654,322 instructions              #    1.55  insns per cycle        
 6,558,871,379 branches                  #  555.455 M/sec                  
       567,204 branch-misses             #    0.01% of all branches        

  11.827228330 seconds time elapsed
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;&lt;strong&gt;Unsorted:&lt;/strong&gt;&lt;/p&gt;

&lt;pre&gt;&lt;code&gt; Performance counter stats for &#x27;./sumtest_unsorted&#x27;:

  28877.954344 task-clock                #    0.998 CPUs utilized          
         2,584 context-switches          #    0.089 K/sec                  
            18 CPU-migrations            #    0.001 K/sec                  
           335 page-faults               #    0.012 K/sec                  
65,076,127,595 cycles                    #    2.253 GHz                    
41,032,528,741 instructions              #    0.63  insns per cycle        
 6,560,579,013 branches                  #  227.183 M/sec                  
 1,646,394,749 branch-misses             #   25.10% of all branches        

  28.935500947 seconds time elapsed
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;It can also do source code annotation with dissassembly.&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;perf record -e branch-misses ./sumtest_unsorted
perf annotate -d sumtest_unsorted
&lt;/code&gt;&lt;/pre&gt;



&lt;pre&gt;&lt;code&gt; Percent |      Source code &amp;amp; Disassembly of sumtest_unsorted
------------------------------------------------
...
         :                      sum += data[c];
    0.00 :        400a1a:       mov    -0x14(%rbp),%eax
   39.97 :        400a1d:       mov    %eax,%eax
    5.31 :        400a1f:       mov    -0x20040(%rbp,%rax,4),%eax
    4.60 :        400a26:       cltq   
    0.00 :        400a28:       add    %rax,-0x30(%rbp)
...
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;See &lt;a href=&quot;https://perf.wiki.kernel.org/index.php/Tutorial&quot; rel=&quot;noreferrer&quot;&gt;the performance tutorial&lt;/a&gt; for more details.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (14, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (14, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 1594, 1574);
INSERT INTO postinstance (post_id, user_id, description) VALUES (15, 3, '&lt;p&gt;If you are curious about even more optimizations that can be done to this code, consider this... Starting with the original loop:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (unsigned i = 0; i &amp;lt; 100000; ++i)
{
    for (unsigned j = 0; j &amp;lt; arraySize; ++j)
    {
        if (data[j] &amp;gt;= 128)
            sum += data[j];
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;With loop interchange, we can safely change this loop to:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (unsigned j = 0; j &amp;lt; arraySize; ++j)
{
    for (unsigned i = 0; i &amp;lt; 100000; ++i)
    {
        if (data[j] &amp;gt;= 128)
            sum += data[j];
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Then, you can see that the &quot;if&quot; conditional is constant throughout the execution of the &quot;i&quot; loop, so you can hoist the &quot;if&quot; out:&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (unsigned j = 0; j &amp;lt; arraySize; ++j)
{
    if (data[j] &amp;gt;= 128)
    {
        for (unsigned i = 0; i &amp;lt; 100000; ++i)
        {
            sum += data[j];
        }
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;Then, you see that the inner loop can be collapsed into one single expression, assuming the floating point model allows it (/fp:fast is thrown, for example)&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;for (unsigned j = 0; j &amp;lt; arraySize; ++j)
{
    if (data[j] &amp;gt;= 128)
    {
        sum += data[j] * 100000;
    }
}
&lt;/code&gt;&lt;/pre&gt;

&lt;p&gt;That one is 100,000x faster than before (-8&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (15, 1, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (15, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (16, 3, 'Thank you for the detailled information!');
INSERT INTO answercomment (post_id, answer_id) VALUES (16, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (16, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (17, 4, 'This is the second best answer here as it gives you everything Mystical&amp;#39;s answer is missing. Knowing how to look at these statistics is extremely valuable.');
INSERT INTO answercomment (post_id, answer_id) VALUES (17, 14);
INSERT INTO activity (post_id, user_id, action) VALUES (17, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (18, 1, 'There is also __builtin_expect in GCC to help the compiler. See &lt;a href=&quot;http://stackoverflow.com/questions/109710/likely-unlikely-macros-in-the-linux-kernel-how-do-they-work-whats-their&quot; title=&quot;likely unlikely macros in the linux kernel how do they work whats their&quot;&gt;stackoverflow.com/questions/109710/&amp;hellip;&lt;/a&gt;');
INSERT INTO answercomment (post_id, answer_id) VALUES (18, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (18, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (19, 4, '@Mysticial perhaps, but I&amp;#39;m thinking pure latency here. We can worry about power consumption when my $200 laptop stops lagging and people start writing actually efficient code.');
INSERT INTO answercomment (post_id, answer_id) VALUES (19, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (19, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (20, 4, '@LinkTheProgrammer I&amp;#39;m not so sure the solution is that simple. Because if it was, they&amp;#39;d probably be doing that already. The main problem I see is that modern CPUs will be predicting multiple branches ahead. And that leads to an exponential state explosion if you want to follow them all. The other thing is that running down multiple paths means you&amp;#39;ll be wasting a lot execution resources on stuff that will be thrown away. And that probably has implications for power consumption as well.');
INSERT INTO answercomment (post_id, answer_id) VALUES (20, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (20, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (21, 4, 'I question the efficacy of human minds when it comes to unnecessary overhead such as branch prediction. I just read up on the Wikipedia article—what smart person invented this so I can smack him upside? Just do two concurrent speculative executions for both branches and then discard the &amp;quot;wrong&amp;quot; branch&amp;#39;s speculative execution.');
INSERT INTO answercomment (post_id, answer_id) VALUES (21, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (21, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (22, 4, '@MatthieuM.: I agree with you but to the extent that compiler may optimize it. Not sure if it will, but I am no expert at Compiler Optimizations. But if you are right, wouldn&amp;#39;t this invalidate the remark &amp;quot;That one is 100,000x faster than before&amp;quot; by vulcan.');
INSERT INTO answercomment (post_id, answer_id) VALUES (22, 15);
INSERT INTO activity (post_id, user_id, action) VALUES (22, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (23, 2, '@saurabheights: Wrong question: why would the compiler NOT loop swap. Microbenchmarks is hard ;)');
INSERT INTO answercomment (post_id, answer_id) VALUES (23, 15);
INSERT INTO activity (post_id, user_id, action) VALUES (23, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (24, 5, '@MooingDuck : The diagram in Surt&amp;#39;s &lt;a href=&quot;http://stackoverflow.com/a/33070112/4509583&quot;&gt;answer below&lt;/a&gt; I think explains why TTFFTTFF is in fact the &amp;quot;pathological case&amp;quot; in Saqlain&amp;#39;s example.');
INSERT INTO answercomment (post_id, answer_id) VALUES (24, 13);
INSERT INTO activity (post_id, user_id, action) VALUES (24, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (25, 4, '@njzk2 it doesn&amp;#39;t. Complexity is the asymptotical behaviour of the time (or size) of a function when its inputs tends to infinity. Branch prediction failures doesn&amp;#39;t change how the curve behaves at infinity, it only adds some constant computation time to the branch operation.');
INSERT INTO answercomment (post_id, answer_id) VALUES (25, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (25, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (26, 2, 'How does this influence (if at all) the evaluation of the complexity of an algorithm?');
INSERT INTO answercomment (post_id, answer_id) VALUES (26, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (26, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (27, 3, 'More simplify way for:  &lt;code&gt;int t = (data[c] - 128) &amp;gt;&amp;gt; 31; sum += ~t &amp;amp; data[c];&lt;/code&gt; is  &lt;code&gt;char t = data[c] &amp;gt;&amp;gt; 7 ; &amp;#47;* Truncating the 7 bits (equivalent to data[c] &amp;gt;=128 ) *&amp;#47; sum += -t &amp;amp; data[c]; &amp;#47;* -t will be equivalent to -1 if data[c] &amp;gt;= 128*&amp;#47;&lt;/code&gt;.');
INSERT INTO answercomment (post_id, answer_id) VALUES (27, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (27, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (28, 4, 'I see, so the 8 seconds was the overhead to stop the train and ask the driver every time. If there was no branch at all, and no branch prediction, then the code will always take 2 seconds (i.e. similar to the case that the prediction is always correct in a system with branch prediction). Thanks for your great explanation @Mysticial');
INSERT INTO answercomment (post_id, answer_id) VALUES (28, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (28, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (29, 4, '@elfan No. As a hypothetical example: If there was no prediction, it would always take 10 seconds. With good prediction, it would be 2 seconds. With consistently bad prediction, it would be 12 seconds. The extra 2 seconds being the overhead of going back. In most cases, it will be closer to the 2 seconds, so it&amp;#39;s a net win.');
INSERT INTO answercomment (post_id, answer_id) VALUES (29, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (29, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (30, 5, '@Mysticial, does it mean in this case the code will complete in around 2 seconds (instead of 12) if there is no branch prediction, and that the extra 10 seconds was because of the overhead of wrong predictions (the train going back)?');
INSERT INTO answercomment (post_id, answer_id) VALUES (30, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (30, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (31, 3, '@elfan No. Branch prediction does not affect correctness. When the processor runs a set of instructions, it must behave &amp;quot;as if&amp;quot; it were running them line-by-line. It can play tricks underneath to make things faster (such as branch prediction), but in the end, it still must respect the program as it is written. For your other question, the processor will know when a prediction is correct once the branch instruction executes and determines which way it&amp;#39;s supposed to go.');
INSERT INTO answercomment (post_id, answer_id) VALUES (31, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (31, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (32, 3, '@mysticial Does it mean that it is possible that the result of the program is incorrect because of the prediction? How does it know/validate whether the guessing is correct? Wouldn&amp;#39;t that still need to actually compute everything to know the correct result for validation?');
INSERT INTO answercomment (post_id, answer_id) VALUES (32, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (32, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (33, 1, '@Zze No. That was just the way it turned out when I derived it. The variable being the mask that either enables the value, or sets it to zero.');
INSERT INTO answercomment (post_id, answer_id) VALUES (33, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (33, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (34, 5, '@Mysticial is there a particular reason you opted for your implementation (declaring an int) over &lt;code&gt;sum += ~((data[c] - 128) &amp;gt;&amp;gt; 31) &amp;amp; data[c];&lt;/code&gt; ?');
INSERT INTO answercomment (post_id, answer_id) VALUES (34, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (34, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (35, 2, '@Adjit No, that&amp;#39;s way too specific. What to take away is that &lt;i&gt;anything&lt;/i&gt; that causes the flow of execution to conditionally change is subject to a performance penalty due to branch misprediction. This includes if-statements, loop-conditions, switches, ternary operators, short-circuiting boolean logic, calls to function pointers, calls to lambdas, calls to virtual/polymorphic methods, etc... (The last 3 of these aren&amp;#39;t related to branch-prediction per se, but the same concept applies in that the processor doesn&amp;#39;t &amp;quot;know where to go&amp;quot; next.)');
INSERT INTO answercomment (post_id, answer_id) VALUES (35, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (35, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (36, 1, '@Mysticial so my takeaway from this then is that &lt;code&gt;if&lt;/code&gt; statements can be bad when checking something in an array inside a for loop that loops through the array (unsorted of course)?');
INSERT INTO answercomment (post_id, answer_id) VALUES (36, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (36, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (37, 3, '@Adjit There&amp;#39;s no simple answer to that. For the particular case here, GCC and ICC can do conditional moves, but VS can&amp;#39;t. But that will change depending on the code. The example in this question &lt;i&gt;is&lt;/i&gt; optimizeable to a conditional move. But not always. Only really simple branches can be optimized this way.');
INSERT INTO answercomment (post_id, answer_id) VALUES (37, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (37, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (38, 1, '@Mysticial correct me if I am wrong - is this applicable to any language that would use GCC to compile? for instance regular C or C# in VS? And with GCC 4.6.1 Branch predication is no longer an issue because of conditional moves?');
INSERT INTO answercomment (post_id, answer_id) VALUES (38, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (38, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (39, 1, '@Riley Same. Exponential resource growth and the fact that prediction is often very accurate.');
INSERT INTO answercomment (post_id, answer_id) VALUES (39, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (39, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (40, 2, '@Mysticial Was your answer basically the same or is there another reason?');
INSERT INTO answercomment (post_id, answer_id) VALUES (40, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (40, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (41, 3, '@Riley I actually did answer the comments about executing both branches. But it seems that my comment got deleted for some reason.');
INSERT INTO answercomment (post_id, answer_id) VALUES (41, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (41, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (42, 2, 'There were a few questions as to why the processor doesn&amp;#39;t just execute both branches. One reason is that processors can have as many as 20 predictions in-flight (guessed but not resolved yet). To handle that many you&amp;#39;d need to be executing 2^20 (1048576) different paths at the same time.');
INSERT INTO answercomment (post_id, answer_id) VALUES (42, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (42, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (43, 1, 'As a side note, there has been some research done where branch predictors were able to &amp;quot;figure out the pattern of rand()&amp;quot;. They had a branch that was basically &lt;code&gt;if( rand.nextInt(100) &amp;lt; 50 )&lt;/code&gt; and correctly predicted something like 99% of the time.');
INSERT INTO answercomment (post_id, answer_id) VALUES (43, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (43, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (44, 1, '@jdero The grammarian in me wants me to think this should read &amp;quot;The grammar&lt;i&gt;ian&lt;/i&gt; in me wants me to think this should read...&amp;quot;');
INSERT INTO answercomment (post_id, answer_id) VALUES (44, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (44, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (45, 1, 'This is a good answer but it should be made clear that it is processor branch prediction that is causing this behaviour. Compilers predict branches too.');
INSERT INTO answercomment (post_id, answer_id) VALUES (45, 2);
INSERT INTO activity (post_id, user_id, action) VALUES (45, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 939, 531);
INSERT INTO postinstance (post_id, user_id, description) VALUES (46, 5, '&lt;p&gt;I hesitate to ask this question, but I read a lot of the career advice from MathOverflow and math.stackexchange, and I couldn&#x27;t find anything similar. &lt;/p&gt;

&lt;p&gt;Four years after the PhD, I am pretty sure that I am going to leave academia soon. I do enjoy teaching and research, but the alpha-maleness, massive egos and pressure to publish are really unappealing to me, and I have never felt that I had the mathematical power to prove interesting results. However, I am really having trouble thinking of anything else to do. Most people seem to think that the main careers open to mathematicians are in banking and finance. I really want to work in some field where I can use mathematics, but it is also important to me to feel like I am contributing something positive or at least not actively doing harm. For this reason, financial speculation is very unappealing to me, although I do find the underlying mathematics quite fascinating.&lt;/p&gt;

&lt;p&gt;Here is my question: what careers which make a positive contribution to society
might be open to academic mathematicians who want to change careers?&lt;/p&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (46, 2, 'Can I use my powers for good?');
INSERT INTO activity (post_id, user_id, action) VALUES (46, 5, 'Create');
INSERT INTO tag (text) VALUES ('soft-question');
INSERT INTO questiontag (question_id, tag_id) VALUES (46, 6);
INSERT INTO tag (text) VALUES ('career-development');
INSERT INTO questiontag (question_id, tag_id) VALUES (46, 7);

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 7, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (47, 5, '&lt;p&gt;The question you seem to be asking is &quot;Can I be paid to do research, without any formal education, if I am very good?&quot; The likely answer is no.  I know many serious researchers across countless fields, and the only ones I am aware of who can make a living without any formal training are inventors who got quite lucky in terms of their ideas and their marketability. Many great artists, mathematicians, and scientists did other things to survive while doing the work they were truly passionate for, and we romanticise many very inspirational people. Research is probably much more a function of diligence and persistence, even when things are depressingly boring, than it is of intelligence or genius. I would suggest reading some of the good bits of advice many modern prodigies have given on the subject. Terence Tao in particular has several good pieces on &lt;a href=&quot;https://terrytao.wordpress.com/career-advice/advice-on-gifted-education/&quot;&gt;accelerated education&lt;/a&gt;, &lt;a href=&quot;https://terrytao.wordpress.com/career-advice/work-hard/&quot;&gt;working hard&lt;/a&gt;, and &lt;a href=&quot;https://terrytao.wordpress.com/career-advice/does-one-have-to-be-a-genius-to-do-maths/&quot;&gt;being a genius&lt;/a&gt;.&lt;/p&gt;

&lt;p&gt;Yes, school can be terribly dull if you are quick. But being able to succeed in that environment is an invaluable human skill, which will prove useful in a research career when looking for funding, or when setting up research groups and similar things, as well as really showing that you have a sense of humility. We can complain about how slow and tedious bureaucracy can be, but if you really are quite good, it is worth your time to learn and understand how to survive in it. Mathematics is not simply something devoid of social interaction or human involvement. Pure and applied mathematics stem from human ideas and are inherently connected to social and cultural concepts, and these connections are often a part of what traditional formal education gives us. I would absolutely advise you to go further than what you see in a classroom, do independent and guided research as early as possible, and test out of whatever classes you can. But skipping the process entirely will handicap your ability to contribute meaningfully to mathematical research. &lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (47, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (47, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 13, 9);
INSERT INTO postinstance (post_id, user_id, description) VALUES (48, 5, '&lt;p&gt;I immediately admit I have not read all the other answers (lack of time), so I might overlap with someone. Nonetheless: After obtaining my MSc degree in math I went to work in computational neuroscience and I find in general mathematicians are highly regarded and very welcome in this field.&lt;/p&gt;

&lt;p&gt;There is also quite a deal of modelling done in neuroscience, these people often do a PhD in math, physics or a related field, then continue with a postdoc in modelling in neuroscience. You might want to check out the lab of Wei Ji Ma for example.&lt;/p&gt;

&lt;p&gt;Lastly, I know that the same welcoming attitude is present in the area of brain computer interfaces, machine learning and any area with a lot of data-analysis or modelling for that matter.&lt;/p&gt;

&lt;p&gt;You seem to want to quit academia altogether so this might not be a direct area you&#x27;ll want to go to, but hopefully it will give you some inspiration.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (48, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (48, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 11, 6);
INSERT INTO postinstance (post_id, user_id, description) VALUES (49, 3, '&lt;p&gt;There are many places a good mathematician like yourself could be employed, however the number of those which necessarily promote any definite good is probably low. They are out there though. One idea that would impress me personally would be working at the Hadron collider however I&#x27;m not sure if there are any spaces open as I am sure there is a large body of scientists who would also love to work there. &lt;/p&gt;

&lt;p&gt;On a more realistic note I would personally really recommend you work for the Global Coral Alliance. In essence all of the worlds coral reefs will be destroyed within a about 100 years, they provide us with many essentials including Cures for HIV/AIDS and contribute over 1 billion dollars to economies they border so it is a pretty significant issue. The job would be calculating rates, calculating a vast array of factors within large scenarios of the real world and doing this job would eventually take you down a road towards leadership of a scientific group and connection to a similar community. I think you would enjoy the change of environment in the workplace and start to enjoy the competition to &#x27;make it&#x27; to a higher status but most importantly that you would be working for a cause that will literally effect all societies within future centuries.&lt;br&gt;&lt;br&gt;&lt;/p&gt;

&lt;p&gt;If this is a bit out there then there are other jobs which are more mathematically inclined within the National Oceanic and Atmospheric Administration of the government which work for good causes and have good pay rates, one I specifically recommend is Physical Scientist/Data Manager, there are currently positions open and you would get most of the benefits of the GCA mentioned above.&lt;/p&gt;

&lt;p&gt;Here is the link of the Job description:&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;https://www.usajobs.gov/GetJob/ViewDetails/386968800&quot;&gt;https://www.usajobs.gov/GetJob/ViewDetails/386968800&lt;/a&gt;&lt;/p&gt;

&lt;p&gt;&lt;br&gt;&lt;br&gt;
One last thing I would really like to put out there is that Batman, Superman, and Spiderman Dont get paid for what they do, they do it because they want to and feel like they have to! Not 1 of the 10,000 people here can tell you the correct answer to your question, only you know what it is. Is there something you want to fix, is there something that you feel isn&#x27;t right in our world? then use your powers and do that thing/fix that problem, whatever it may be. In the end we are all going to end up in a wooden box 10 feet under the soil so why die with any regrets? We live in the illusion of the Now but despite appearances the reality is, the next time you blink you will be 86 and wondering if you even have tomorrow; Don&#x27;t settle for less, strive and struggle to achieve what you believe....&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (49, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (49, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 12, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (50, 1, '&lt;p&gt;I think the best answer to career questions is to think outside of academic divisions. This is about &lt;em&gt;you&lt;/em&gt;, not &quot;a mathematician&quot;.&lt;/p&gt;

&lt;p&gt;Start with the &lt;a href=&quot;https://en.wikipedia.org/wiki/List_of_S%26P_500_companies&quot;&gt;S&amp;amp;P 500&lt;/a&gt; and &lt;a href=&quot;http://www.inc.com/inc5000/index.html&quot;&gt;Inc 5000&lt;/a&gt; (I know you&#x27;re in &lt;a href=&quot;https://en.wikipedia.org/wiki/NZX_50_Index#Constituents&quot;&gt;New Zealand&lt;/a&gt; but international research isn&#x27;t a bad thing).&lt;/p&gt;

&lt;p&gt;Learn what companies actually do and what kind of people they want to do those things. You don&#x27;t need to honour the sunk costs of a Ph.D.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (50, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (50, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 37, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (51, 1, '&lt;p&gt;I am currently a PhD student in robotics and AI, and it seems to me that the field is thirsty for good mathematicians, to counterbalance the vast majority of heuristic-minded engineers (like myself). In fact, the main reason why I am a part of the MSE community is because my work often leads to interesting mathematical systems that are beyond my ability to analyze.&lt;/p&gt;

&lt;p&gt;I find the field very appealing and I can see it being used as a force for good, e.g. medicine and healthcare, personal care, search and rescue. There is always the argument that what you do to could eventually be used in military technology, but I guess that only makes you as guilty as the inventor of the knife is for stabbings. That being said, I have made a decision never to work directly on military applications.&lt;/p&gt;

&lt;p&gt;In this way you could remain in academia, but I&#x27;m fairly sure that you would have an easier time publishing, because the mathematics involved will be much simpler that what you are dealing with at the moment. At the same time, you will get to meet lots of interesting people of both genders (less &quot;alpha-maleness&quot;), as the field is probably one of the most inter-disciplinary around. Apart from the obvious engineers and computer scientists, you get psychologists (human-robot interaction, machine learning), linguists (natural language processing), biologists (bio-inspiration), social scientists (social impact) philosophers (robot ethics), and people from pretty much every other science that you can think of.&lt;/p&gt;

&lt;p&gt;I wish you the best of luck in whatever you decide to do!&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (51, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (51, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 81, 39);
INSERT INTO postinstance (post_id, user_id, description) VALUES (52, 5, '&lt;p&gt;&lt;strong&gt;Original Answer&lt;/strong&gt;: &lt;/p&gt;

&lt;p&gt;I am surprised no one has suggested you could start collaborating with the scientists working on the &lt;a href=&quot;http://www.azimuthproject.org/azimuth/show/Azimuth+Project&quot;&gt; Azimuth Project&lt;/a&gt;. I was initiated by the renowed mathematical physicist &lt;a href=&quot;http://en.wikipedia.org/wiki/John_C._Baez&quot;&gt;John Baez&lt;/a&gt;. He recently stopped working on $n$-categories and their applications in physics to start &quot;... help saving our beleaguered planet&quot;. He now works at the Centre for Quantum Technologies in Singapore (this is their &lt;a href=&quot;http://www.quantumlah.org/&quot;&gt;website&lt;/a&gt;).&lt;/p&gt;

&lt;p&gt;The azimuth project focusses on tackling the various environmental problems we are currently facing, including, but not limited to: global warming, extinction, deforestation, ocean acidification, dead zones, the water crisis and peak oil. &lt;/p&gt;

&lt;p&gt;Everything is more elaborately and carefully explained in the links I provided you with and the links within the websites to which the links will direct you. &lt;/p&gt;

&lt;p&gt;I believe this project is an overwhelmingly noble initiative and in my opinion, you would certainly use your powers for &quot;good&quot; if you started working on it. &lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Added&lt;/strong&gt; on the seventh of April, 2014: &lt;/p&gt;

&lt;p&gt;Recently, I discovered &quot;The Ocean Cleanup&quot; project. For a sustainability competition, Boyan Slat came up with a design for an ocean cleanup array that can help getting rid of a lot of plastic in the sea. The device consists of anchored network of floating booms and processing platforms that could be dispatched to garbage patches around the world. From &lt;a href=&quot;http://inhabitat.com/19-year-old-student-develops-ocean-cleanup-array-that-could-remove-7250000-tons-of-plastic-from-the-worlds-oceans/&quot;&gt;inhabitat&lt;/a&gt;:  &lt;/p&gt;

&lt;blockquote&gt;
  &lt;p&gt;Instead of moving through the ocean, the array would span the radius of a garbage patch, acting as a giant funnel. The angle of the booms would force plastic in the direction of the platforms, where it would be separated from plankton, filtered and stored for recycling.&lt;/p&gt;
&lt;/blockquote&gt;

&lt;p&gt;According to the organisation&#x27;s (yup, the design is now being fleshed out by a whole organisation of students, postdocs and professors from the TU Delft, aided by volunteers) website, 
they&#x27;re still looking for: &lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;Hydrodynamic/Fluid dynamics modellers&lt;/li&gt;
&lt;li&gt;Advanced Computational Modellers &lt;/li&gt;
&lt;li&gt;Physical Oceanographers &lt;/li&gt;
&lt;li&gt;Biologists and Remote Sensing experts &lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;For more information: their website is over &lt;a href=&quot;http://www.boyanslat.com/plastic/&quot;&gt;here&lt;/a&gt;. You can also view Boyan&#x27;s TEDx &lt;a href=&quot;https://www.youtube.com/watch?v=ROW9F-c0kIQ&quot;&gt;Talk&lt;/a&gt;. &lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (52, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (52, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 40, 7);
INSERT INTO postinstance (post_id, user_id, description) VALUES (53, 5, '&lt;p&gt;Use your skills to help improving cryptographic algorithms in projects such as Tor, BitTorrent and Bitcoin.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (53, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (53, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 32, 30);
INSERT INTO postinstance (post_id, user_id, description) VALUES (54, 3, '&lt;p&gt;I&#x27;m not sure these areas have been mentioned already.&lt;/p&gt;

&lt;p&gt;I would outline two areas that are beneficial for the society and interesting for mathematicians: cancer research and computer virus propagation. They are closer than one might think, applying tools from probability theory such as Markov chains, stochastic processes, limiting distributions, equilibrium states, optimization, etc.&lt;/p&gt;

&lt;p&gt;You will be able to help a lot of people and maybe even save lives. &lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (54, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (54, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 54, 5);
INSERT INTO postinstance (post_id, user_id, description) VALUES (55, 1, '&lt;p&gt;I skimmed through the answers and didn&#x27;t see this mentioned already, but have you considered working for an entity involved in making mathematical education resources available online?  There&#x27;s a &lt;em&gt;huge&lt;/em&gt; gap between what current technology could allow us to do in mathematics education and what is currently being done.  One could argue that mathematics education will likely be very, very different ten to twenty years from now.  One site that has recieved a lot of attention and funding is Khan Academy, but I am sure there are lot more initiatives taking place around the world.&lt;/p&gt;

&lt;p&gt;Imagine a world where the same group of mathematicians no longer spend each semester giving the same (often uninspired) lectures on college algebra and introductory calculus, because high quality lectures and supporting material are &lt;em&gt;freely&lt;/em&gt; available online.  Instead, classroom time is used to give individual attention to each student&#x27;s current state of progress, and research mathematicians spend more of their teaching time supervising undergraduate research projects instead of explaining the perils of dividing by zero to students who are busily texting their friends their plans for Friday night.  When you&#x27;re done having this nice dream, go out and find a job where you can help make this a reality! :)&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (55, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (55, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 37, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (56, 3, '&lt;p&gt;Being an actuary is a good job, always ranked as one of the top jobs based on things such as salary and stress level.  If you find the right company, you can work 40 hours a week and get paid a lot of money, while working on something that is necessary to culture (car insurance, for example).  As someone who is good at math, you could pass 2 or 3 exams in a few months.  You wouldn&#x27;t want to do more than that until after you start a job, because companies don&#x27;t want to pay someone with no experience a huge extra amount of money.  If you have much experience with probability, you could probably pass the first one with very little study, possibly none at all depending on how much experience you have.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (56, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (56, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 147, 123);
INSERT INTO postinstance (post_id, user_id, description) VALUES (57, 2, '&lt;p&gt;A lot of responses to this question are more upbeat than I think is warranted.  Many answers give detailed lists of uses of mathematics in a way that suggests the writer has no experience actually hiring people out of academia to meet those needs.  There is an awful lot of &quot;fields X, Y, and Z need people to do math, so you can probably get a job doing that.&quot;  The irony is that this attitude is most common &lt;em&gt;within academia&lt;/em&gt;.  Most people who will assume that a math PhD with no job experience outside of academia is good for something, to the point of paying them to work on an applied problem, are &lt;em&gt;in academia&lt;/em&gt;--- in bioengineering, machine learning, and other fields that people have recommended.  The point I would underline here is that these people work &lt;em&gt;in universities&lt;/em&gt; and if you want to get into these areas, you will have to stay in academia, at least a little.&lt;/p&gt;

&lt;p&gt;The experience of a researcher at a university in some applied area is very different from the experience of a professor of pure mathematics.  For example there are often fewer teaching duties (e.g. lab supervision, instead of teaching large classes--- or no teaching duties at all).  And there are more options for sources of outside funding--- unlike in most of math, where if you don&#x27;t get a grant from a government agency that funds math, you aren&#x27;t getting a grant.  But there will still be publishing papers, and you will still spend the majority of your time with people who share their social characteristics more with other academics than they do with the general population.&lt;/p&gt;

&lt;p&gt;Academia isn&#x27;t the only culture with negative aspects.  If you look for a private sector job, you will find that most people--- even in very technical companies--- are not open to hiring people with no private sector experience and no personal connections for non-entry-level jobs.  And they aren&#x27;t open to hiring PhDs for entry level jobs (you are &quot;overqualified&quot;).  At many companies, it&#x27;s not &quot;we do a lot of mathy stuff, so math PhDs can help a lot,&quot; but &quot;we do a lot of real world stuff here, and anybody who spends decades buried in textbooks won&#x27;t know anything about that.&quot;  For example, unless you have an easily documented and publicized history of programming (e.g. contributions to open source projects, or reasonably self-contained projects that you can make public and stick on a personal website), most companies will not give you a second look for any software engineering job.  Even if you&#x27;ve done a ton of programming, you will never get a chance to show it, because most companies will not call a math PhD back on the off chance they can do something useful.  Say what you will about academia, but if you apply to an academic research group whose work has some mathematical flavor, they are much more likely to actually give you a chance.&lt;/p&gt;

&lt;p&gt;Someone linked a talk by Cathy O&#x27;Neil in another answer.  It contains good advice, but recall that this was a talk given at MIT.  Cathy O&#x27;Neil has a PhD from Harvard and research experience at MIT.  Her first work post-academia was at D. E. Shaw.  It is reasonable to assume that she does not have any experience with the obstacles that confront the average academic who wants to transition into something else.  She writes: &quot;being really [flipping] good at math is considered a superpower by the people outside. This is because you can do stuff with your math that they actually don’t know how to do, no matter how much time they spend trying.&quot;  These are the words of someone who has had a very atypical experience in transitioning from academia to the private sector (granted, given the audience of the talk, it is reasonable to assume that most of the audience will be atypical also).  People coming out of academia who are not coming from the absolute top schools, with the connections that often come from that, are generally &lt;em&gt;not&lt;/em&gt; greeted as superheroes by the private sector.  (I want to make clear: I&#x27;m not criticizing Cathy here, or suggesting that she hasn&#x27;t worked hard to get where she is.  It&#x27;s just a lot harder to do what she has done than you might think, reading only her words and not considering the context.)&lt;/p&gt;

&lt;p&gt;I would say: if you want to get a mathy job, unless you have a documented history of things that are of immediate relevance to the private sector, or professionally useful personal connections in the outside world--- stay in academia, but switch fields to an applied area (lots of good suggestions have been given here).  After a few years, you may have connections that can help you transition to a mathy job outside of academia, or at least a broader resume that people might be more inclined to take seriously.  I don&#x27;t mean to be negative here--- you probably &lt;em&gt;should&lt;/em&gt; be taken seriously as you are now.  But outside of academia, in my view, the odds are that you won&#x27;t.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (57, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (57, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 26, 9);
INSERT INTO postinstance (post_id, user_id, description) VALUES (58, 1, '&lt;p&gt;Cathy O&#x27;Neil gave a talk at MIT entitled &quot;Math in Business&quot; last week; she summarizes that talk in &lt;A href=&quot;http://mathbabe.org/2011/10/22/math-in-business/&quot;&gt;this blog post&lt;/a&gt;. There may be some ideas here.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (58, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (58, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 46, 25);
INSERT INTO postinstance (post_id, user_id, description) VALUES (59, 2, '&lt;p&gt;Your main assets are your ability to learn new topics and analyze complex problems quantitatively. These can be applied to any number of fields, some of which were mentioned above.&lt;/p&gt;

&lt;p&gt;Try by searching for job openings as an &lt;em&gt;algorithm developer&lt;/em&gt; and similar titles. Often requirements will include a Ph.D. in mathematics or a related field. Such jobs are often exploratory and include writing a prototype using either mathematical utilities such as Matlab, Mathematica or R, or programming languages such as Perl, Phyton, C. These prototypes either serve as an internal research tool or as a starting point for distributed software components. &lt;/p&gt;

&lt;p&gt;Indeed, machine learning is often used and it would be a good idea to familiarize yourself with the approach and even gain some hands on experience, e.g, via the &lt;a href=&quot;http://www.ml-class.org&quot;&gt;online course&lt;/a&gt; mentioned above by @Mech.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (59, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (59, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 21, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (60, 1, '&lt;p&gt;Google? Microsoft Research? Some funky startup?&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (60, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (60, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 301, 194);
INSERT INTO postinstance (post_id, user_id, description) VALUES (61, 3, '&lt;p&gt;Procedural world generation and AI in the field of games development needs people like You(!) to forward the state of the industry from the drivel we see today. It is as creative as it is technically challenging, and in my forays in this field (disclaimer: as someone generally mathematically inept), I have seen the use of a broad spectrum of mathematics and logic; to name just a few such applications:&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;Diffusion equations for chemical detection in AI (such as simulating a sense of smell and pulling AI entities along the gradients created by these equations toward their goals)&lt;/li&gt;
&lt;li&gt;Radiosity algorithms using eg. Lambert&#x27;s equations in realtime raycasting&lt;/li&gt;
&lt;li&gt;Fluid dynamics using cellular automata&lt;/li&gt;
&lt;li&gt;Graph theory for generating planar connected world graphs, including such aspects as finding and eliminating Kuratowski subgraphs&lt;/li&gt;
&lt;li&gt;Combinatorics in evaluating corner cases for constructive solid geometry applications&lt;/li&gt;
&lt;li&gt;Statistical modelling and analysis for game rules balancing&lt;/li&gt;
&lt;li&gt;Minkowski sums in opening sufficiently broad paths for navigation during world generation&lt;/li&gt;
&lt;li&gt;Spatial quantisation and subdivision as a general optimisation&lt;/li&gt;
&lt;li&gt;Quaternions to RK4 integration to Delaunay&#x27;s triangulations in physics and geometry&lt;/li&gt;
&lt;li&gt;Combinatorics, probability theory and general statistics in projecting the emergent outcomes of complex systems&lt;/li&gt;
&lt;li&gt;Probability theory in random number generation eg. Mersenne Twister&lt;/li&gt;
&lt;li&gt;Formal grammars in narrative and physical object construction (eg. Lindemayer systems)&lt;/li&gt;
&lt;li&gt;And more mathematics applicable to broader field of computer programming, such as analysing and reducing computational complexity.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;This is a very haphazard and sparse collection of applications, so forgive me but my knowledge of the very existence of many of these areas has come from a game designer/developer&#x27;s perspective. In any case, this list goes on ad infinitum for all practical purposes, considering that modelling worlds draws from every known field, from demographics to hydrodynamics to geomorphology to psychology to genetics to narratology... with mathematics being what all of these have in common.&lt;/p&gt;

&lt;p&gt;The spectrum in game development is vast, because you are modelling the mechanics of worlds / universes, according to the processing contraints of the system(s) you are developing for -- this latter part is where the real challenge comes in, and a broad, sound understanding of mathematics becomes even more necessary to apply new optimisation tricks.&lt;/p&gt;

&lt;p&gt;A sprinkling of some of my favourite places on the www, which may give you some insight into the breadth I&#x27;m talking about:&lt;/p&gt;

&lt;ul&gt;
&lt;li&gt;&lt;a href=&quot;http://www.infinity-universe.com/Infinity/index.php?option=com_content&amp;amp;task=blogcategory&amp;amp;id=0&amp;amp;Itemid=47&quot;&gt;Infinity&lt;/a&gt;, generating galaxies from the top down.&lt;/li&gt;
&lt;li&gt;Miguel Cepero&#x27;s &lt;a href=&quot;http://procworld.blogspot.com/&quot;&gt;blog&lt;/a&gt; about his as yet unnamed, procedurally generated voxel-based world.&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;http://hastac.org/blogs/elijahmeeks/procedural-humanities-interview-tarn-adams-creator-dwarf-fortress&quot;&gt;An interview&lt;/a&gt; with the author of Dwarf Fortress, describing how various aspects of the world were modelled (from history to geography to psychology).&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;http://www.astrolog.org/labyrnth/algrithm.htm&quot;&gt;A collection of pages&lt;/a&gt; on procedural generation of mazes (graph theory).&lt;/li&gt;
&lt;li&gt;&lt;a href=&quot;http://www.youtube.com/watch?v=mySER0p9F64&amp;amp;feature=related&quot;&gt;A video&lt;/a&gt; showing some emerging technologies in the virtual worlds arena.&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;I would speculate that it is far easier to be a trained mathematician and become a good programmer, than the reverse. In many ways I would rather be in your shoes, reading my post, than vice versa. Of course that&#x27;s assuming that this is a convincing argument in terms of changing career direction!&lt;/p&gt;

&lt;p&gt;If this does interest you even remotely, don&#x27;t let what they say about games put you off. The line between games, traditional linear narratives, sandboxes for physical and AI experimentation, educational products (&quot;serious games&quot;) and so on, is blurring at a rapidly accelerating rate. The vast majority of games, I would say all but less than 1%, are the same old rehashed tripe. But there is enormous potential for creativity, the more so for those with a strong mathematical background, as evidenced by some of the links above. I think there is something very positive in giving people new and inspiring spaces in which to play, relax and learn.&lt;/p&gt;

&lt;hr&gt;

&lt;p&gt;P.S. If my use of terms doesn&#x27;t make sense, please correct me on every point, I joined this site to improve my mathematical knowledge and your criticism is welcome.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (61, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (61, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 86, 67);
INSERT INTO postinstance (post_id, user_id, description) VALUES (62, 4, '&lt;p&gt;Consider a career working for a publisher of technical books. Like Springer or Birkhauser. Be a force for good mathematics!&lt;/p&gt;

&lt;p&gt;Years ago just after I finished my PhD I spent a week as a taxi driver (I don&#x27;t recommend this career choice) -- technically I was helping with a conference and shuttling participants around. One of the people I met (the wife of the principal speaker) was a publisher working for Birkhauser. I mentioned that I still hadn&#x27;t found &quot;the job&quot; and she suggested coming to work for her. They are always in need of someone with the ability to edit/correct/deal with mathematically technical texts. I didn&#x27;t take her up on the offer, but have thought about it at times. The idea of sitting around reading and discussing math texts all day sounds...well...like goofing around on math.stackexchange.com :)&lt;/p&gt;

&lt;p&gt;My second suggestion (this one&#x27;s probably already been suggested) is join the Peace Corps for a few years. I met a &quot;semi-retired&quot; mathematician last year who joined the Peace Corps and went off to Africa (for an adventure). You would probably end up training math teachers in a foreign country.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (62, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (62, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 191, 114);
INSERT INTO postinstance (post_id, user_id, description) VALUES (63, 1, '&lt;p&gt;Have you read the book &#x27;Surely you&#x27;re joking, Mr. Feynman?&#x27; The great physicist suffers a similar problem to what you describe - having worked on the atomic bomb, he felt &#x27;burned out&#x27; and unable to do further physics. Somehow, he wasn&#x27;t able to interest himself, and work with the same vigour as before.&lt;/p&gt;

&lt;p&gt;He then took the approach not to work to any reasonable gain, but to enjoy physics! To enjoy messing around with it, calculating things of no use to anyone. And he found that suddenly, he had his hunger back.&lt;/p&gt;

&lt;p&gt;Think about why you went into this profession in the first place. Surely you love maths? Well, enjoy it now, as you enjoyed it when you were a small child. And you never know, your work may  turn out to be useful (in Feynman&#x27;s case, he won a noble prize for it).&lt;/p&gt;

&lt;p&gt;And even if you choose to ignore everything else said, read the book. It&#x27;s a great read.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (63, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (63, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 55, 20);
INSERT INTO postinstance (post_id, user_id, description) VALUES (64, 3, '&lt;p&gt;there are a set of skills required for &lt;a href=&quot;http://mathbabe.org/2011/09/25/why-and-how-to-hire-a-data-scientist-for-your-business/&quot;&gt;&#x27;data scientists&#x27;&lt;/a&gt; that drawn mainly from math topics like graph theory and statistics. I&#x27;m not sure if this fits your ethos requirements though. You&#x27;ll have to figure it out by yourself.&lt;/p&gt;

&lt;p&gt;more reading: &lt;a href=&quot;http://www.technologyreview.com/blog/mimssbits/27201/#.TpW-IJsr2so&quot;&gt;http://www.technologyreview.com/blog/mimssbits/27201/#.TpW-IJsr2so&lt;/a&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (64, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (64, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 49, 13);
INSERT INTO postinstance (post_id, user_id, description) VALUES (65, 4, '&lt;p&gt;Why not apply your math skills to Machine Learning or AI?  The IT industry is starving for people like this.  Check out www.ml-class.org as just one example Stanford is doing to help bring more ML to the industry.  It&#x27;s right up a mathmatics background alley!&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (65, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (65, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 43, 14);
INSERT INTO postinstance (post_id, user_id, description) VALUES (66, 3, '&lt;p&gt;I really appreciate that you are asking such a question. I suggest looking into non profits, and using an organization like Data Without Borders for guidence:
&lt;a href=&quot;http://datawithoutborders.cc/&quot;&gt;http://datawithoutborders.cc/&lt;/a&gt;&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (66, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (66, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 51, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (67, 5, '&lt;p&gt;I also hesitate to give this answer but here it goes. &lt;/p&gt;

&lt;p&gt;You do not have to work in the most obvious jobs to help the society. As a mathematician you must be fully aware of the fact that many useless looking abstract mathematical tools turned out to be extremely useful in practice only later. &lt;/p&gt;

&lt;p&gt;Besides how do you know that education is helping the society where we have an increasing evidence that our educational system is very wrong. So in reality, you might be doing the exact opposite what you wish initially i.e. making people love math and make them suffer by a pursuing a degree among those mean and arrogant alpha-males (Exaggeration police was here! But you can see &lt;a href=&quot;http://www.youtube.com/watch?v=zDZFcDGpL4U&quot;&gt;this&lt;/a&gt;,&lt;a href=&quot;http://www.youtube.com/watch?v=mCbdS4hSa0s&quot;&gt;this&lt;/a&gt; and especially &lt;a href=&quot;http://www.ted.com/talks/dan_meyer_math_curriculum_makeover.html&quot;&gt;this&lt;/a&gt; for the fun of it). &lt;/p&gt;

&lt;p&gt;Moreover, you might do more good if you really love your subject and create a use of it. Many concepts like &lt;a href=&quot;http://mitpress.mit.edu/books/full_pdfs/Street-Fighting_Mathematics.pdf&quot;&gt;Street-Fighting Mathematics&lt;/a&gt; and &lt;a href=&quot;http://www.freakonomics.com/&quot;&gt;Freakonomics&lt;/a&gt; showed that the academia is missing something that is truly crucial for its self-sustained dignity. The relevance. &lt;/p&gt;

&lt;p&gt;By relevance, I don&#x27;t mean that poem starting with &lt;em&gt;math is pure, would you know that it is relevant from the start&lt;/em&gt;. I know what R&amp;amp;D departments do, because I worked for quite some time in one particular industry. Hence, I know how to measure how much of my work will be complete fun and useless (for the time being) and how much of it will spin-off to something that would be good for a product. Same holds for the academia, you can&#x27;t expect every single person to publish and turn everything upside down with one 3-page article. Some people don&#x27;t want to publish anyway. Some people love to get their hands dirty and work on applied math problems which most of them are not even publishable. Some even go into private companies and carry on their stuff applied to a special (and possibly boring but, hey who cares) practical problem (Not to mention the Google&#x27;s &lt;a href=&quot;http://en.wikipedia.org/wiki/PageRank&quot;&gt;PageRank&lt;/a&gt;).&lt;/p&gt;

&lt;p&gt;Long story short, you would better off if you follow nobody&#x27;s instincts but yours. Try to materialize your career plan with the given limited resources and surplus of happiness that it provides. Sounds cliché but it became a cliché, in the first place, for a reason. By itself, it is a damn hard problem. So you might work on it as a mathematician starting from the Lagrangian :P&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (67, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (67, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 141, 93);
INSERT INTO postinstance (post_id, user_id, description) VALUES (68, 1, '&lt;p&gt;I found myself in a similar situation just over a decade ago: two years after PhD in mathematics, disenchanted with academia, and needing to make ends meet.&lt;/p&gt;

&lt;p&gt;My own choice was to go into computing (specifically, I&#x27;m now a software engineer).  A mathematician of any stripe will find this field easy to pick up, and some of the skills gained in completing the PhD -- in particular, meticulousness, precision, and tenacity -- are of monumental import.&lt;/p&gt;

&lt;p&gt;I&#x27;ve worked on software in several different fields: mechanical engineering (aerospace), nuclear energy, finance, and Child Protection Services, among others. My job satisfaction is very high; I only wish I&#x27;d gone into it earlier.&lt;/p&gt;

&lt;p&gt;A final, more general note: your options are vast and wide, much broader than you&#x27;d expect.  I&#x27;d suggest looking into fields where the &lt;em&gt;style&lt;/em&gt; of your mathematics is particularly applicable, and where you&#x27;d be both interested and happy. Software engineering has special attraction for me because (a) my area of math was combinatorics, and (b) I have a penchant for fixing problems and simplifying structural models.&lt;/p&gt;

&lt;p&gt;Best of luck!&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (68, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (68, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 89, 5);
INSERT INTO postinstance (post_id, user_id, description) VALUES (69, 3, '&lt;p&gt;I&#x27;ve seen people in pure math who wanted to switch fields while saving the world get postdocs in biostatistics or bioinformatics. This was a few years ago when these fields were especially 
&quot;hot&quot; but I would guess it&#x27;s still true. There were many expanding labs and research groups and they would often take people switching from other fields. If you go into these fields, epecially bioinformatics, you may end out doing a lot of programming, so be sure this is something you&#x27;d be comfortable with.&lt;/p&gt;

&lt;p&gt;Another option would be to get a masters degree, or even go for a second PhD if you can stand it. But I don&#x27;t think you should have to go this far. &lt;/p&gt;

&lt;p&gt;If you are into programming you could try working for a company that does mathematical software, as KCd suggested.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (69, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (69, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 57, 5);
INSERT INTO postinstance (post_id, user_id, description) VALUES (70, 3, '&lt;p&gt;You may want to consider moving to a country where there is a lack of trained mathematicians. I&#x27;m sure that many of these countries have the problem of their best minds being drawn away by exciting overseas opportunties. The universities in these countries are probably less focused on research and more focused on the pragmatic task of upskilling their workers.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (70, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (70, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 106, 94);
INSERT INTO postinstance (post_id, user_id, description) VALUES (71, 3, '&lt;p&gt;Don&#x27;t write off the finance industry. If you are confident you can avoid your own self-corruption there is no need to think you can&#x27;t have an amazing impact on the world by working in finance.&lt;/p&gt;

&lt;p&gt;There are many areas of finance that add tremendous stability to society and are a good thing (for example, insurance). Mathematicians are able to provide the models and techniques that mean these things can be fair and sustainable as a business.&lt;/p&gt;

&lt;p&gt;The finance industry will teach you what things are worth investing in and what things are a waste of time and money. Lots of firms and organisations are incredibly wasteful and stunted in potential because they do not know how best to organise their money. Someone smart like you can learn important skills to take elsewhere to solve these problems. As a mathematician you&#x27;ll enter straight away into one of the more lucrative verticals of the banking sector. Give yourself ten years to make as much wealth as possible then leave. You&#x27;ll have the experience and capital to set up a business/charity you believe in.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (71, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (71, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 38, 16);
INSERT INTO postinstance (post_id, user_id, description) VALUES (72, 3, '&lt;p&gt;You might want to look into holography related fields, which are mathematical complexity bound, but have the potential to change a great deal of how we interact with the world.&lt;/p&gt;

&lt;p&gt;Beyond TV and Movies, computer generated holograms have uses in everything from medical imagery, geographic data representation and remote visualization.  We are at our core visually driven creatures, and so having an enhanced way of visualizing data, whether real or artificially generated, has a huge impact on our ability to comprehend and react to the world around us.  Dare I say it, but the ability to present data more dynamically is a world changer.&lt;/p&gt;

&lt;p&gt;There are companies out there investing in the technology needed to make mass market holographic devices, and with good reason: We quite literally have all the technology required to do holography, and the only thing preventing holographic visualization from becoming the norm is the ability to do the math efficiently.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (72, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (72, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 88, 56);
INSERT INTO postinstance (post_id, user_id, description) VALUES (73, 5, '&lt;p&gt;The difficulty here is that &quot;a positive contribution to society&quot; turns out to be quite a subjective thing. So even if you feel other people might know what you mean, there&#x27;s lots of space for confusion and disagreement.&lt;/p&gt;

&lt;p&gt;I can tell you what I did with my maths (across the UK / NW Europe). I&#x27;ve tried to make a positive contribution to society, by my own standards. Your mileage may vary.&lt;/p&gt;

&lt;p&gt;I&#x27;ve designed photovoltaic systems. I&#x27;ve been an urban transport planner and modeller. I&#x27;ve been an energy analyst, and created models for local, national and international clean-energy supply and demand. My work has cut across engineering, physics, politics, economics, sociology, psychology, urban design and architecture.&lt;/p&gt;

&lt;p&gt;There are still plenty of gaps in all these fields; for example, for clean-energy modelling, it would be very useful to have a simulation package that could produce plausible patterns of insolation, rainfall and wind, at continental scale, and that which reproduced real-world temporal and spatial correlations, at the level of minutes to years.&lt;/p&gt;

&lt;p&gt;Note that you&#x27;re unlikely to use PhD-level maths in many places at all: there&#x27;s a trade-off between depth of maths used, and number of options open to you.&lt;/p&gt;

&lt;p&gt;Good luck.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (73, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (73, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 128, 22);
INSERT INTO postinstance (post_id, user_id, description) VALUES (74, 5, '&lt;p&gt;You could go into operations research and work in the nonprofit/humanitarian sector.  While OR has traditionally been applied to problems in business and industry, the nonprofit and humanitarian world has started to use it more and more in recent years.  There are even interesting research problems being generated because the constraints and objectives in the nonprofit world don&#x27;t always boil down to the same kinds of mathematics that constraints and objectives in the business world do.&lt;/p&gt;

&lt;p&gt;INFORMS (the Institute for Operations Research and the Management Sciences) has been promoting this lately under the slogan &quot;Doing Good with Good OR.&quot;  A &lt;a href=&quot;http://interfaces.journal.informs.org/content/41/3.toc&quot;&gt;recent issue&lt;/a&gt; of the INFORMS journal &lt;em&gt;Interfaces&lt;/em&gt; was devoted to humanitarian applications of OR; check it out to get some ideas for ways to use your powers for good.  Or do a search on &quot;&lt;a href=&quot;http://www.google.com/search?q=doing%20good%20with%20good%20or&amp;amp;ie=utf-8&amp;amp;oe=utf-8&amp;amp;aq=t&amp;amp;rls=org.mozilla%3aen-US%3aofficial&amp;amp;client=firefox-a&quot;&gt;Doing Good with Good OR&lt;/a&gt;&quot; for more ideas.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (74, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (74, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 316, 140);
INSERT INTO postinstance (post_id, user_id, description) VALUES (75, 3, '&lt;p&gt;If you are in the US, there are several thousand institutions of higher learning, and at many of them there is very little &quot;pressure to publish&quot;. At others, the &quot;pressure to publish&quot; can be met by publishing a textbook or some work of scholarship that does not require proofs of interesting (original) results. High schools also need qualified Mathematics teachers. Consider staying in academia, just moving to a different part of it, as an option for using your powers to do good. &lt;/p&gt;

&lt;p&gt;I suspect, but cannot be sure, that much of what I&#x27;ve written applies outside the US as well. &lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (75, 46, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (75, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (76, 2, '@Flounderer I&amp;#39;m sorry to hear that&amp;#39;s been your experience. I guess it&amp;#39;s true that everyone has to find their own space, after a fashion. With games, one can create that space without asking anyone&amp;#39;s permission. Still, I worry sometimes that this is the path of least resistance. It should not be this way.');
INSERT INTO answercomment (post_id, answer_id) VALUES (76, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (76, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (77, 2, '@ArcaneEngineer Thanks for sharing your thoughts! After four years, I have actually pretty much given up trying to do &amp;quot;good things&amp;quot; because I have found that people who are already working on them will jealously defend their patch against help from outside. I have decided just to try not to do harm.');
INSERT INTO answercomment (post_id, answer_id) VALUES (77, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (77, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (78, 4, 'Games are an exploration of humanity&amp;#39;s inner space, and while I will always encourage people to explore their imaginations and create beautiful / fun things, it was never my intent (by all these upvotes) to lend more importance to this than to dealing with the immediate issues we face as a planet and species. As with all things in life, we must balance this inner exploration against external circumstances. If you see a way to use your mathematical powers for those purposes, do so: not everyone gets the chance to be part of the world-changing things you may end up doing as a result. Good luck.');
INSERT INTO answercomment (post_id, answer_id) VALUES (78, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (78, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (79, 3, '4 years have passed; there are some things I&amp;#39;d like to say in retrospect. (1) I didn&amp;#39;t expect so many upvotes - a window into how scarily games-centric we&amp;#39;ve become. (2) I see (young) folks making amazing technological strides nowadays to deal with global issues like mitigating global warming (@DanB), dealing with population explosion, improving energy usage or food / water / air situation, strides in education, or preparing to head for the stars. Attending these needs has become crucial, and equally as or more rewarding than games in our current climate of scientific and technological growth.');
INSERT INTO answercomment (post_id, answer_id) VALUES (79, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (79, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (80, 2, 'I hope more people upvote this as I would like it to become the most upvoted answer. It&amp;#39;s a lot more suitable to the question than &amp;quot;Go and work in a liberal arts college&amp;quot;!');
INSERT INTO answercomment (post_id, answer_id) VALUES (80, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (80, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (81, 4, 'Thats a great set of ideas right there, good suggestion');
INSERT INTO answercomment (post_id, answer_id) VALUES (81, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (81, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (82, 2, '@OllieFord You are right, but we Latin Americans are generally &lt;a href=&quot;https://en.wikipedia.org/wiki/American_%28word%29#Spain_and_Latin_America&quot; rel=&quot;nofollow noreferrer&quot;&gt;sensible about this issue&lt;/a&gt;.');
INSERT INTO answercomment (post_id, answer_id) VALUES (82, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (82, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (83, 5, '@Matem&amp;#225;ticosChibchas ..yes thanks for that. My point was &amp;quot;US&amp;quot; is no more correct than &amp;quot;America&amp;quot;.');
INSERT INTO answercomment (post_id, answer_id) VALUES (83, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (83, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (84, 1, '@OllieFord &lt;a href=&quot;https://en.wikipedia.org/wiki/Americas#Etymology_and_naming&quot; rel=&quot;nofollow noreferrer&quot;&gt;America&lt;/a&gt;');
INSERT INTO answercomment (post_id, answer_id) VALUES (84, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (84, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (85, 3, 'Note: &lt;a href=&quot;http://bactra.org/reviews/wolfram/&quot; rel=&quot;nofollow noreferrer&quot;&gt;NKS review has moved to here&lt;/a&gt;');
INSERT INTO answercomment (post_id, answer_id) VALUES (85, 69);
INSERT INTO activity (post_id, user_id, action) VALUES (85, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (86, 5, '@Matem&amp;#225;ticosChibchas United States of what?');
INSERT INTO answercomment (post_id, answer_id) VALUES (86, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (86, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (87, 5, 'People generally have the impression that mathematicians on Wall St are generally being hired to do fancy arbitrage analysis and those being hired by agencies like the NSA are doing fancy crypto.  In reality, there are significant numbers of mathematicians at both doing very little of any of that.');
INSERT INTO answercomment (post_id, answer_id) VALUES (87, 71);
INSERT INTO activity (post_id, user_id, action) VALUES (87, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (88, 3, '@Jase the &amp;quot;they&amp;quot; in your quote is described as &amp;quot;most people&amp;quot; in the previous sentence.  I am very familiar with the phenomenon you describe.  It&amp;#39;s possible for a math PhD to hit a homerun and get a very lucrative job on Wall St, but it depends on a variety of factors, some of which has to do with the hiring climate -- a very volatile factor.  I&amp;#39;d say on the whole the reluctance to hire PhDs for entry-level is valid, except for certain parts of Wall St.  Even then, the opportunities for non-stars is somewhat limited (depends significantly on certain bulge-brackets hiring a lot or not).');
INSERT INTO answercomment (post_id, answer_id) VALUES (88, 57);
INSERT INTO activity (post_id, user_id, action) VALUES (88, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 5, 4);
INSERT INTO postinstance (post_id, user_id, description) VALUES (89, 1, 'An answerer was criticized for suggesting Wolfram as &amp;quot;using powers for good&amp;quot;, and you suggest Google and Microsoft? That&amp;#39;s not the reason for my down-vote thought, it is that you didn&amp;#39;t add anything new that wasn&amp;#39;t yet referred in other answers.');
INSERT INTO answercomment (post_id, answer_id) VALUES (89, 60);
INSERT INTO activity (post_id, user_id, action) VALUES (89, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (90, 5, '@FelixMarin Hardly with a PhD in Mathematics, &lt;i&gt;perhaps&lt;/i&gt; with a PhD in Economics. If you know about a job opportunity like you are talking about, let me know!!!!');
INSERT INTO answercomment (post_id, answer_id) VALUES (90, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (90, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (91, 1, '@Matem&amp;#225;ticosChibchas In your country a PhD can get around US $ 5000 per month in a university.');
INSERT INTO answercomment (post_id, answer_id) VALUES (91, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (91, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (92, 3, '@Scott Now you have me worried about the state of his fingers. Did he lose many of them in a horrible carpentry accident?');
INSERT INTO answercomment (post_id, answer_id) VALUES (92, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (92, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 8, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (93, 3, 'Do write off the finance industry.');
INSERT INTO answercomment (post_id, answer_id) VALUES (93, 71);
INSERT INTO activity (post_id, user_id, action) VALUES (93, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (94, 3, 'I can appreciate the influence of character limits on the precision of your phrasing, but no one here said insurance is evil. The other counterpoints are useful though, if not altogether persuasive.');
INSERT INTO answercomment (post_id, answer_id) VALUES (94, 71);
INSERT INTO activity (post_id, user_id, action) VALUES (94, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Deleted', 3, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (95, 4, 'In the US, there&amp;#39;s Big Pharma, there&amp;#39;s Big Tobacco, and there&amp;#39;s also Big Education. This is a business of selling nicely wrapped hollow products to school districts -- little if anything has changed in 50 years since Feynman&amp;#39;s chapter in &lt;a href=&quot;http://www.textbookleague.org/103feyn.htm&quot; rel=&quot;nofollow noreferrer&quot;&gt;Surely You&amp;#39;re Joking&lt;/a&gt;. To feed this industry and give it a semblance of an academically solid one, there&amp;#39;s a sister area of mathematics education. If you have observed a downward trend in math preparedness of your undergrads over the past 5-10-20 years, thank these guys. I doubt that you are welcome in their world.');
INSERT INTO answercomment (post_id, answer_id) VALUES (95, 55);
INSERT INTO activity (post_id, user_id, action) VALUES (95, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 6, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (96, 4, 'Also is worth mentioning that those &amp;quot;level entry&amp;quot; jobs can be really terrible jobs. It&amp;#39;s important before taking the decision talk with sector workers,  know the average times of advances in the chosen career path and be sure that worths the effort.');
INSERT INTO answercomment (post_id, answer_id) VALUES (96, 57);
INSERT INTO activity (post_id, user_id, action) VALUES (96, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (97, 2, 'Thanks for this answer. I too do programming and wish I knew more maths. Maths + programming skills = immense power (to do good or evil). Just look at the founders of Google. Also, I never knew that &amp;#39;narrative&amp;#39; had an &amp;#39;ology&amp;#39;. Narratology - Wow. Who&amp;#39;d a thunk it. Well Aristotle, for one, I spose. Okay I&amp;#39;m rambling. In short, good answer.');
INSERT INTO answercomment (post_id, answer_id) VALUES (97, 61);
INSERT INTO activity (post_id, user_id, action) VALUES (97, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (98, 5, 'Same here: educated in Math, working in software industry (EDA).');
INSERT INTO answercomment (post_id, answer_id) VALUES (98, 68);
INSERT INTO activity (post_id, user_id, action) VALUES (98, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (99, 5, 'Any evidence for Google hiring &amp;quot;pure math-ers&amp;quot;?');
INSERT INTO answercomment (post_id, answer_id) VALUES (99, 60);
INSERT INTO activity (post_id, user_id, action) VALUES (99, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 6, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (100, 5, 'Thanks for saying &amp;quot;US&amp;quot; instead of &amp;quot;America&amp;quot;.');
INSERT INTO answercomment (post_id, answer_id) VALUES (100, 75);
INSERT INTO activity (post_id, user_id, action) VALUES (100, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (101, 2, 'I know of a biostatistics department that regularly interviews and hires mathematicians.');
INSERT INTO answercomment (post_id, answer_id) VALUES (101, 69);
INSERT INTO activity (post_id, user_id, action) VALUES (101, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (102, 5, '+1 for this meaningful answer. Thanks!');
INSERT INTO answercomment (post_id, answer_id) VALUES (102, 63);
INSERT INTO activity (post_id, user_id, action) VALUES (102, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 10, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (103, 2, 'W3Schools.com is filled with inaccurate information. See &lt;a href=&quot;http://www.w3fools.com/&quot; rel=&quot;nofollow noreferrer&quot;&gt;w3fools.com&lt;/a&gt;. I would instead recommend buying a book or &lt;a href=&quot;http://www.codecademy.com&quot; rel=&quot;nofollow noreferrer&quot;&gt;codecademy.com&lt;/a&gt; / &lt;a href=&quot;http://alternativeto.net/software/codecademy/&quot; rel=&quot;nofollow noreferrer&quot;&gt;alternativeto.net/software/codecademy&lt;/a&gt;.');
INSERT INTO answercomment (post_id, answer_id) VALUES (103, 68);
INSERT INTO activity (post_id, user_id, action) VALUES (103, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 4, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (104, 2, '&lt;b&gt;&amp;quot;And they aren&amp;#39;t open to hiring PhDs for entry level jobs (you are &amp;quot;overqualified&amp;quot;).&amp;quot;&lt;/b&gt; Do you have any evidence to back this claim? A maths PhD I know got 4 job offers in entry-level finance, probably the in the top 5% in terms of success.');
INSERT INTO answercomment (post_id, answer_id) VALUES (104, 57);
INSERT INTO activity (post_id, user_id, action) VALUES (104, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 13, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (105, 3, 'How is insurance evil? We need mathematicians to price the extremely hard to price products that wouldn&amp;#39;t exist without the talent. Insurance is incredible -- long-term disability insurance, life insurance, the positive impact of these products is far reaching. The evidence that statistical arbitrage is a net harm is &lt;b&gt;not in yet&lt;/b&gt;. Some academics view automated market makers (at least) as liquidity providers without which a market can not even exist, and spread traders as aiding in instantaneous cross-asset price discovery. Sell-side quants can build products to help (e.g.)farmers reduce risk');
INSERT INTO answercomment (post_id, answer_id) VALUES (105, 71);
INSERT INTO activity (post_id, user_id, action) VALUES (105, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 186, 146);
INSERT INTO postinstance (post_id, user_id, description) VALUES (106, 5, '&lt;p&gt;On most A-10s I have seen, the area under the cockpit is darker than the rest of the plane. Is there a reason for this?&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;https://i.stack.imgur.com/7Q2HT.png&quot; alt=&quot;enter image description here&quot;&gt;&lt;/p&gt;
');
INSERT INTO question (post_id, topic_id, title) VALUES (106, 3, 'What is the dark spot visible below the cockpit on A-10s?');
INSERT INTO activity (post_id, user_id, action) VALUES (106, 5, 'Create');
INSERT INTO tag (text) VALUES ('military');
INSERT INTO questiontag (question_id, tag_id) VALUES (106, 8);

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 24, 21);
INSERT INTO postinstance (post_id, user_id, description) VALUES (107, 3, '&lt;p&gt;&lt;a href=&quot;https://en.wikipedia.org/wiki/Fairchild_Republic_A-10_Thunderbolt_II#Colors_and_markings&quot;&gt;Wikipedia&lt;/a&gt; cites the biological concept of &lt;a href=&quot;https://en.wikipedia.org/wiki/Mimicry#Automimicry&quot;&gt;automimicry&lt;/a&gt;, or intraspecific mimicry, where a species develops a part of the body which appears similar to another part, e.g. a tail appearing like a head, so that predators become confused as to the orientation or direction of movement of their prey.&lt;/p&gt;

&lt;p&gt;As per egid&#x27;s answer, this technological form of automimicry ideally helps to degrade an enemy&#x27;s capability to successfully attack an A-10C (or similarly painted aircraft or vehicle).&lt;/p&gt;

&lt;p&gt;See also the similar concept of &lt;a href=&quot;https://en.wikipedia.org/wiki/Dazzle_camouflage&quot;&gt;&lt;em&gt;dazzle camouflage&lt;/em&gt;&lt;/a&gt; or &lt;em&gt;razzle dazzle&lt;/em&gt; used on combat and merchant naval ships during World War I.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (107, 106, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (107, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 42, 14);
INSERT INTO postinstance (post_id, user_id, description) VALUES (108, 5, '&lt;p&gt;Also used by the South African Air Force on its Gripen fighter aircraft and, before that, its Cheetah (upgraded Mirage) fighter aircraft.&lt;/p&gt;

&lt;p&gt;The intention is to create momentary uncertainty as to which direction an aircraft may turn, both for air-to-air encounters against other aircraft and when doing low-level manoeuvring in the ground-attack role.&lt;/p&gt;

&lt;p&gt;An image of a South African Air Force Gripen C, showing the false cockpit on the bottom:
&lt;img src=&quot;https://i.stack.imgur.com/prlhq.jpg&quot; alt=&quot;SAAF Gripen C&quot;&gt;
&lt;br/&gt;&lt;em&gt;By Brent Best&lt;/em&gt;&lt;/p&gt;

&lt;p&gt;And an image of a South African Air Force Cheetah C showing the same:&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;https://i.stack.imgur.com/XBnCg.jpg&quot; alt=&quot;SAAF Cheetah C&quot;&gt;
&lt;br/&gt;&lt;em&gt;By Christo Crous&lt;/em&gt;&lt;/p&gt;

&lt;p&gt;Note the diamond-shape on the bottom of the Cheetah C. A similar pattern is painted on the top surface of the SA Air Force&#x27;s Gripens. This reportedly helps create more uncertainty when seen in  brief glimpses during combat, similar to the way dazzle camouflage on ships in WWI worked.&lt;/p&gt;

&lt;p&gt;This is an illustration, taken from a flight sim, of what the effect looks like on a Cheetah C with a mostly &#x27;clean&#x27; configuration (no drop tanks or bombs):
&lt;img src=&quot;https://i.stack.imgur.com/lEQeU.jpg&quot; alt=&quot;SAAF Cheetah C (simulated)&quot;&gt;&lt;/p&gt;

&lt;p&gt;South African Air Force fighter aircraft have used the false cockpit and diamond-shape camouflage ideas since the last 1980s, after proving the concepts through testing.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (108, 106, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (108, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 233, 85);
INSERT INTO postinstance (post_id, user_id, description) VALUES (109, 3, '&lt;p&gt;It&#x27;s a false cockpit, a type of camouflage &lt;a href=&quot;http://www.google.com/patents/US4448371&quot;&gt;patented in 1980&lt;/a&gt; by Keith Ferris, a US artist and camouflage designer. From some angles, it makes it difficult to determine the orientation of the aircraft. The Canadians were the first to apply it; pictured is a CF-18 Hornet with one:&lt;/p&gt;

&lt;p&gt;&lt;img src=&quot;https://i.stack.imgur.com/Kls6Jm.jpg&quot; alt=&quot;Canadian CF-18 Hornet, inverted, with false canopy.&quot;&gt;&lt;/p&gt;

&lt;p&gt;Notice how at a glance, it takes a second to realize the Hornet is inverted and pulling towards the ground. During dogfights this can be enough to make opposing pilots think the aircraft is going a different direction. It might not seem like much in a photo, or if you&#x27;re watching an aircraft fly past at an air show or airport. In the stress of combat while pulling extra Gs it&#x27;s more than enough to confuse or delay a reaction.&lt;/p&gt;

&lt;p&gt;For the air to ground mission, this is particularly important. If an A-10 encountered antiaircraft fire or an enemy aircraft it would have to rely on its own agility to escape or gain the upper hand. Other nations have adopted this technique — I&#x27;ve seen French and Russian types, and possibly Gripens of some air force. As far as I know, the A-10 is the only US aircraft regularly camouflaged in this way.&lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (109, 106, 'True');
INSERT INTO activity (post_id, user_id, action) VALUES (109, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 18, 3);
INSERT INTO postinstance (post_id, user_id, description) VALUES (110, 4, '&lt;p&gt;There was an article on this in &lt;em&gt;Aerospace&lt;/em&gt; magazine way back in the late 1980s (I still have a photocopy somewhere).  &lt;/p&gt;

&lt;p&gt;They called it Visual Stealth. The article included the long history, including
using lights to illuminate the darker regions of aircraft when viewed from the ground.  &lt;/p&gt;

&lt;p&gt;One picture I saw clearly showed a &#x27;tail shadow&#x27; painted on the bottom
of an F16. False cockpits were common, as were painting the tops and bottoms 
different colors. Ground Strike aircraft would commonly have yellows and 
brown camouflage, white in the winter (Germany). The Navy was using blues and
grays, with the tail squadron markings rather dull.  &lt;/p&gt;
');
INSERT INTO answer (post_id, question_id, accepted) VALUES (110, 106, 'False');
INSERT INTO activity (post_id, user_id, action) VALUES (110, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (111, 5, '&lt;code&gt;&amp;quot;Notice how at a glance, it takes a second to realize the Hornet is inverted and pulling towards the ground.&amp;quot;&lt;/code&gt; And perhaps even more scary... imagine it comes up on you from above and behind... and looks like it&amp;#39;s diving inverted into your flight path.');
INSERT INTO answercomment (post_id, answer_id) VALUES (111, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (111, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (112, 5, 'I think it&amp;#39;s &amp;quot;clever camouflage&amp;quot; @egid .   Camouflage is where the plane is coloured the same as the background.   Visual Stealth is where clever misrepresentations of its own structure are painted on it (like butterflies have eyes on their wings, by the way).');
INSERT INTO answercomment (post_id, answer_id) VALUES (112, 110);
INSERT INTO activity (post_id, user_id, action) VALUES (112, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (113, 2, '@DavidRicherby yes, they&amp;#39;re quite similar in many ways.');
INSERT INTO answercomment (post_id, answer_id) VALUES (113, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (113, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (114, 5, '@jwenting &amp;quot;Ferris advocated a lot more, including spraying the aircraft in geometric patterns in many shades to break up its outline.&amp;quot; That sounds a lot like the &lt;a href=&quot;https://en.wikipedia.org/wiki/Dazzle_camouflage&quot; rel=&quot;nofollow noreferrer&quot;&gt;dazzle camouflage&lt;/a&gt; used by the British and other navies during WWI and a little later.');
INSERT INTO answercomment (post_id, answer_id) VALUES (114, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (114, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 2);
INSERT INTO postinstance (post_id, user_id, description) VALUES (115, 2, '@davey There were plenty of dogfights in the 1991 Gulf War, &lt;a href=&quot;https://en.wikipedia.org/wiki/Air_engagements_of_the_Gulf_War&quot; rel=&quot;nofollow noreferrer&quot;&gt;according to Wikipedia&lt;/a&gt;; there were also air-to-air kills in the Kosovo conflict.');
INSERT INTO answercomment (post_id, answer_id) VALUES (115, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (115, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 1, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (116, 5, '&amp;quot;Visual stealth&amp;quot;? Isn&amp;#39;t this just camouflage? :)');
INSERT INTO answercomment (post_id, answer_id) VALUES (116, 110);
INSERT INTO activity (post_id, user_id, action) VALUES (116, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (117, 1, '@davey : don&amp;#39;t forget that there wasn&amp;#39;t a single air battle between fighters ever since, as there wasn&amp;#39;t any war in the last few decades between countries which could both field fighters, so there was no opportunity to any fight, either distant or dogfight.');
INSERT INTO answercomment (post_id, answer_id) VALUES (117, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (117, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 1);
INSERT INTO postinstance (post_id, user_id, description) VALUES (118, 5, 'The Hungarian Air Force has since adopted it on their Gripens and Saab painted one on the underside of its Gripen NG demo aircraft, so it may yet be used by the Swedish Air Force too. Rumour has it that they were impressed by how well it worked for SAAF Gripens during Exercise Lion Effort 2012 in Sweden, where the SAAF pilots achieved high kill ratios in close-in air-to-air combat. The purpose of the diamond is to cause just that extra bit of confusion for the opposing pilot, as it creates conflicting shapes. It was painted on both top and bottom on the Cheetahs, only the top on the Gripens.');
INSERT INTO answercomment (post_id, answer_id) VALUES (118, 108);
INSERT INTO activity (post_id, user_id, action) VALUES (118, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (119, 1, 'Given that the last aerial dogfight was in about 1986 and even that was in the film/fiasco Top Gun it&amp;#39;s all probably a bit moot.');
INSERT INTO answercomment (post_id, answer_id) VALUES (119, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (119, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (120, 4, 'Ah, I was apparently thinking of SAAF Gripens, then! I&amp;#39;m not sure what&amp;#39;s up with the dark diamond on top surfaces, but it does seem to add to the illusion.');
INSERT INTO answercomment (post_id, answer_id) VALUES (120, 108);
INSERT INTO activity (post_id, user_id, action) VALUES (120, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 12, 9);
INSERT INTO postinstance (post_id, user_id, description) VALUES (121, 5, 'You would think the cost of paint would be far less than even the slightest risk of losing a plane and a trained pilot.');
INSERT INTO answercomment (post_id, answer_id) VALUES (121, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (121, 5, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (122, 1, 'It can make a difference, which helps because in combat aircraft don&amp;#39;t remain pristine for long.');
INSERT INTO answercomment (post_id, answer_id) VALUES (122, 108);
INSERT INTO activity (post_id, user_id, action) VALUES (122, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (123, 2, 'looks like metal fatigue, dirt, grime, and age actually improve the effect');
INSERT INTO answercomment (post_id, answer_id) VALUES (123, 108);
INSERT INTO activity (post_id, user_id, action) VALUES (123, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 6, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (124, 2, 'Dazzle Camouflage is super-cool, eg &lt;a href=&quot;http://blog.iso50.com/wp-content/uploads/2013/01/dazzle-camo-2-450x184.jpeg&quot; rel=&quot;nofollow noreferrer&quot;&gt;blog.iso50.com/wp-content/uploads/2013/01/&amp;hellip;&lt;/a&gt;');
INSERT INTO answercomment (post_id, answer_id) VALUES (124, 107);
INSERT INTO activity (post_id, user_id, action) VALUES (124, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (125, 4, 'Painting top and bottom different was done because aircraft would then stand out less when normal way up. Mostly of interest for low flying aircraft, which is why it&amp;#39;s mostly gone now, as the proliferation of MANPADS has caused operations to move a lot higher than they were at the time (when longer range SAMs and AAA were the major threat).');
INSERT INTO answercomment (post_id, answer_id) VALUES (125, 110);
INSERT INTO activity (post_id, user_id, action) VALUES (125, 4, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 2, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (126, 2, 'The USN also implemented it on their F/A-18s for a while. AFAIK it wasn&amp;#39;t adopted in part for cost reasons, it&amp;#39;s cheaper to just spray the entire aircraft in a single colour... Ferris advocated a lot more, including spraying the aircraft in geometric patterns in many shades to break up its outline. Worked well, but was too cumbersome and expensive for large scale adoption. The Canadians have far fewer aircraft, so total cost of adoption is quite a bit lower than it&amp;#39;d be for the US.');
INSERT INTO answercomment (post_id, answer_id) VALUES (126, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (126, 2, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 0, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (127, 1, '@voretaq7 huh, I remember seeing that article but I must have never actually read it');
INSERT INTO answercomment (post_id, answer_id) VALUES (127, 110);
INSERT INTO activity (post_id, user_id, action) VALUES (127, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 7, 4);
INSERT INTO postinstance (post_id, user_id, description) VALUES (128, 1, 'The Smithsonian &lt;i&gt;Air &amp;amp; Space Magazine&lt;/i&gt; website also had a short feature on visual stealth in 2013 called &lt;a href=&quot;http://www.airspacemag.com/multimedia/how-to-hide-an-airplane-1390425/&quot; rel=&quot;nofollow noreferrer&quot;&gt;How To Hide an Airplane&lt;/a&gt;. I imagine it&amp;#39;s probably less detailed than a trade publication, but they have some pretty awesome pictures including &lt;a href=&quot;http://i.stack.imgur.com/SnjaX.jpg&quot; rel=&quot;nofollow noreferrer&quot;&gt;this one&lt;/a&gt; -- There are two aircraft in that shot.');
INSERT INTO answercomment (post_id, answer_id) VALUES (128, 110);
INSERT INTO activity (post_id, user_id, action) VALUES (128, 1, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 3, 0);
INSERT INTO postinstance (post_id, user_id, description) VALUES (129, 3, 'Interesting. I&amp;#39;m surprised that USAF and USN haven&amp;#39;t adopted this more generally.');
INSERT INTO answercomment (post_id, answer_id) VALUES (129, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (129, 3, 'Create');

INSERT INTO post (current_state, up_score, down_score) VALUES ('Published', 17, 14);
INSERT INTO postinstance (post_id, user_id, description) VALUES (130, 2, 'didn&amp;#39;t even have to read it, that picture said it all, thanks :) Very cool');
INSERT INTO answercomment (post_id, answer_id) VALUES (130, 109);
INSERT INTO activity (post_id, user_id, action) VALUES (130, 2, 'Create');

INSERT INTO report (post_id, user_id, title, content, reason) VALUES (11, 4, 'this post is off-topic', 'i do not think this kind of post belongs here', 'off-topic');
INSERT INTO report (post_id, user_id, title, content, reason) VALUES (18, 3, 'this post is off-topic', 'i do not think this kind of post belongs here', 'off-topic');
INSERT INTO report (post_id, user_id, title, content, reason) VALUES (128, 1, 'this post is offensive', 'this is really poor taste', 'other');
INSERT INTO report (post_id, user_id, title, content, reason) VALUES (27, 1, 'this post is offensive', 'i do not think this kind of post belongs here', 'offensive');
INSERT INTO report (post_id, user_id, title, content, reason) VALUES (56, 2, 'test report', 'not the first time this user has done it', 'offensive');

INSERT INTO useraccbadge (user_id, badge_id) VALUES (1, 2);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (2, 2);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (3, 3);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (4, 3);
INSERT INTO useraccbadge (user_id, badge_id) VALUES (5, 3);

INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 1);
INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 2);
INSERT INTO topicuseracc (mod_id, topic_id) VALUES (1, 3);
