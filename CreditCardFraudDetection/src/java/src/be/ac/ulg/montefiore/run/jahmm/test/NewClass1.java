package src.be.ac.ulg.montefiore.run.jahmm.test;

/**
 *
 * @author chinmay patil
 */
import dal.clsdal;
import java.io.IOException;
import java.util.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import src.be.ac.ulg.montefiore.run.jahmm.*;
import src.be.ac.ulg.montefiore.run.jahmm.draw.GenericHmmDrawerDot;
import src.be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.KullbackLeiblerDistanceCalculator;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.MarkovGenerator;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * This class demonstrates how to build a HMM with known parameters, how to
 * generate a sequence of observations given a HMM, how to learn the parameters
 * of a HMM given observation sequences, how to compute the probability of an
 * observation sequence given a HMM and how to convert a HMM to a Postscript
 * drawing.
 */
public class NewClass1
{

       //this are the observation of our states. ie low med high
	public enum Packet {
		Low, Med,High;

		public ObservationDiscrete<Packet> observation() {
			return new ObservationDiscrete<Packet>(this);
		}
	};
        clsdal obj=new clsdal();
        ResultSet rs=null;
        
  //initialization
	  List<ObservationDiscrete<Packet>> testSequence = new ArrayList<ObservationDiscrete<Packet>>();
            ObservationDiscrete<Packet> packetLow = Packet.Low.observation();
            ObservationDiscrete<Packet> packetMed = Packet.Med.observation();
            ObservationDiscrete<Packet> packetHigh = Packet.High.observation();
  
        //create 2 hmm 1=learnthmm 2=hmm and also baumwelch obj
        public Hmm<ObservationDiscrete<Packet>> learntHmm ;
        public Hmm<ObservationDiscrete<Packet>> hmm ;
        BaumWelchLearner bwl = new BaumWelchLearner();
        // This object measures the distance between two HMMs
        KullbackLeiblerDistanceCalculator klc = new KullbackLeiblerDistanceCalculator();
 //initialization complete
  
  
  
	public  void main(String[] argv,int l,int m,int h)
	throws java.io.IOException
	{
        try {
            System.out.println(argv[0]+" "+argv[1]);
            obj.connect();
            /* Build a HMM and generate observation sequences using this HMM */
            //obj.updateSQL("delete from data");


               rs = obj.execSQL("select * from observationsequence where UserID='"+argv[1]+"'");
            if(rs.next()){

                for(int i=3;i<18;i++){
                if(rs.getString(i).equals("l")){
                     testSequence.add(packetLow);
                }
                else if(rs.getString(i).equals("m")){
                      testSequence.add(packetMed);
                }
                else if(rs.getString(i).equals("h")){
                     testSequence.add(packetHigh);
                }
                }
            }

            hmm= buildHmm();
            System.out.println(hmm);
            
            learntHmm= buildInitHmm();
             System.out.println("learntHmm"+learntHmm);
//            obj.updateSQL("inser into data(hmm,buildhmm) values ('"+hmm+"','"+learntHmm+"')");
            List<List<ObservationDiscrete<Packet>>> sequences;


            //sequences = generateSequences(hmm);
            sequences = generateSequences1(argv[0],l,m,h);
            /* Baum-Welch learning */
          
//            String username=cookieValue;

            // Incrementally improve the solution
            for (int i = 0; i < 50; i++) {
                System.out.println("Distance at iteration " + i + ": " + klc.distance(learntHmm, hmm));
                learntHmm = bwl.iterate(learntHmm, sequences);
                
            }
            System.out.println("Resulting HMM:\n" + learntHmm);

          
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewClass1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(NewClass1.class.getName()).log(Level.SEVERE, null, ex);
        }
	}


	/* The HMM this example is based on */

	public Hmm<ObservationDiscrete<Packet>> buildHmm()
	{
		Hmm<ObservationDiscrete<Packet>> hmm =
			new Hmm<ObservationDiscrete<Packet>>(10,
					new OpdfDiscreteFactory<Packet>(Packet.class));

		hmm.setPi(0, 0.1);
                hmm.setPi(1, 0.1);
                hmm.setPi(2, 0.1);
                hmm.setPi(3, 0.1);
                hmm.setPi(4, 0.1);
                hmm.setPi(5, 0.1);
                hmm.setPi(6, 0.1);
                hmm.setPi(7, 0.1);
                hmm.setPi(8, 0.1);
                hmm.setPi(9, 0.1);

		hmm.setOpdf(0, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
		hmm.setOpdf(1, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
		hmm.setOpdf(2, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
		hmm.setOpdf(3, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(4, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(5, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(6, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(7, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(8, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));
                hmm.setOpdf(9, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.33, 0.33,0.34 }));

		return hmm;
	}


	/* Initial guess for the Baum-Welch algorithm */

	public Hmm<ObservationDiscrete<Packet>> buildInitHmm()
	{
		Hmm<ObservationDiscrete<Packet>> hmm =
			new Hmm<ObservationDiscrete<Packet>>(10,
					new OpdfDiscreteFactory<Packet>(Packet.class));

		hmm.setPi(0, 0.1);
                hmm.setPi(1, 0.1);
                hmm.setPi(2, 0.1);
                hmm.setPi(3, 0.1);
                hmm.setPi(4, 0.1);
                hmm.setPi(5, 0.1);
                hmm.setPi(6, 0.1);
                hmm.setPi(7, 0.1);
                hmm.setPi(8, 0.1);
                hmm.setPi(9, 0.1);

                
                
//efficient initialization of opdf based on opdf and clusters
                for(int i=0;i<10;i++){
                    if(testSequence.get(i).equals(packetLow)){

                        hmm.setOpdf(i, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.40, 0.30,0.30 }));
                    }
                    else if(testSequence.get(i).equals(packetMed)){

                        hmm.setOpdf(i, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.40,0.30}));
                    }
                      else if(testSequence.get(i).equals(packetHigh)){

                        hmm.setOpdf(i, new OpdfDiscrete<Packet>(Packet.class,
					new double[] { 0.30, 0.30,0.40 }));
                    }
                }

//or if simple initialization of opdf
//		hmm.setOpdf(0, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.40, 0.30,0.30 }));
//		hmm.setOpdf(1, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.40,0.30}));
//		hmm.setOpdf(2, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.30,0.40 }));
//		hmm.setOpdf(3, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.30,0.40 }));
//                hmm.setOpdf(4, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.40,0.30 }));
//                hmm.setOpdf(5, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.40,0.30 }));
//                hmm.setOpdf(6, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.40, 0.30,0.30 }));
//                hmm.setOpdf(7, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.30,0.40 }));
//                hmm.setOpdf(8, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.40, 0.30,0.30 }));
//                hmm.setOpdf(9, new OpdfDiscrete<Packet>(Packet.class,
//				new double[] { 0.30, 0.30,0.40 }));
//

		return hmm;
	}
        //modified method of generate sequence
	//my own modified method
	public  List<List<ObservationDiscrete<Packet>>>
	generateSequences1(String prob,int l,int m,int h)
	{
		
		
		List<List<ObservationDiscrete<Packet>>> sequences = 
                        new ArrayList<List<ObservationDiscrete<Packet>>>();
		for (int i = 0; i <300; i++)
			sequences.add(observationSequence(15,prob,l,m,h));
System.out.println("Sequences: " +(sequences));
		return sequences;
	}
	public List<ObservationDiscrete<Packet>>
             observationSequence (int length,String prob,int l,int m,int h)
        {
            ArrayList<ObservationDiscrete<Packet>> sequence = new ArrayList<ObservationDiscrete<Packet>>();
            sequence.clear();
             Random randomGenerator = new Random();
             int count=0;
             int count1=0;
             int count2=0;
             int countlow=0;
             int countmed=0;
             int counthigh=0;

             if(prob.equals("l")){
countlow=l;
countmed=m;
counthigh=h;

             }
            else if(prob.equals("m")){
countlow=l;
countmed=m;
counthigh=h;

             }
               else if(prob.equals("h")){
countlow=l;
countmed=m;
counthigh=h;

             }

		while (length > 0)
                {
                    int randomInt = randomGenerator.nextInt(14);
                    {
                    if(count<countlow && (randomInt==0||randomInt==3||randomInt==6||randomInt==9||randomInt==12))
                    {sequence.add(Packet.Low.observation());
                     count++;
                    length--;
                    }
                    else if(count1<countmed &&(randomInt==1||randomInt==4||randomInt==7||randomInt==10||randomInt==13))
                    {sequence.add(Packet.Med.observation());
                      count1++;
                     length--;
                     }
                    else if(count2<counthigh &&(randomInt==2||randomInt==5||randomInt==8||randomInt==11||randomInt==14))
                     {sequence.add(Packet.High.observation());
                    count2++;
                     length--;
                    }

                    }
		}

             
		return sequence;
        }
	/* Generate several observation sequences using a HMM */

	public <O extends Observation> List<List<O>>
	generateSequences(Hmm<O> hmm)
	{
		MarkovGenerator<O> mg = new MarkovGenerator<O>(hmm);

		List<List<O>> sequences = new ArrayList<List<O>>();
		for (int i = 0; i < 1000; i++)
			sequences.add(mg.observationSequence(15));
System.out.println("Sequences: " +(sequences));
		return sequences;
	}




//        public List<ObservationDiscrete<Packet>>
//        sequser(List<ObservationDiscrete<Packet>> sequence)
//        {
//             List<ObservationDiscrete<Packet>> testSequence = new ArrayList<ObservationDiscrete<Packet>>();
//             testSequence=sequence;
//
//            List<ObservationDiscrete<Packet>> testSequence1 = new ArrayList<ObservationDiscrete<Packet>>();
//         String yourinput;
//        ObservationDiscrete<Packet> packetLow = Packet.Low.observation();
//	ObservationDiscrete<Packet> packetMed = Packet.Med.observation();
//        ObservationDiscrete<Packet> packetHigh = Packet.High.observation();
//            String Low ="1";
//            String Med ="2";
//            String High ="3";
//
//            for(int i=1;i<15;i++)//purposely started it from 1
//               testSequence1.add(testSequence.get(i));
//
//            return testSequence1;
//        }


        public double hh1(String[] arr_os,String[] arr_new_os,Hmm<ObservationDiscrete<Packet>> hmm1,Hmm<ObservationDiscrete<Packet>> learntHmm1){


            System.out.println("hmm1 "+hmm1);
            System.out.println("learnthmm11 "+learntHmm1);
              double probdiff=0.0;
            try {
         
            //declaration only one time
            List<ObservationDiscrete<Packet>> testSequence1 = new ArrayList<ObservationDiscrete<Packet>>();
            List<List<ObservationDiscrete<Packet>>> sequences1 = new ArrayList<List<ObservationDiscrete<Packet>>>();
             List<ObservationDiscrete<Packet>> testSequence2 = new ArrayList<ObservationDiscrete<Packet>>();

            testSequence1.clear();

            for (int i = 0; i < arr_new_os.length; i++) {
                if (arr_new_os[i].equals("l")) {
                    testSequence1.add(packetLow);
                } else if (arr_new_os[i].equals("m")) {
                    testSequence1.add(packetMed);
                } else if (arr_new_os[i].equals("h")) {
                    testSequence1.add(packetHigh);
                }
            }

                for (int i = 0; i < arr_os.length; i++) {
                if (arr_os[i].equals("l")) {
                    testSequence2.add(packetLow);
                } else if (arr_os[i].equals("m")) {
                    testSequence2.add(packetMed);
                } else if (arr_os[i].equals("h")) {
                    testSequence2.add(packetHigh);
                }
            }

            //            do {
            //seq prob 1
            //		System.out.println("Sequence probability1: " +
            //				learntHmm.probability(testSequence));
            //                System.out.println("Sequence 1: " + (testSequence));
            //add 15 element in test seq 2
//            testSequence1 = sequser(testSequence);
            //seq prob 2
            //		System.out.println("Sequence probability2: " +
            //				learntHmm.probability(testSequence1));
            //               System.out.println("Sequence 2: " + (testSequence1));
            //calculate fraud or not hh11
            double seq = learntHmm1.probability(testSequence2);
            System.out.println(seq);
            double seq1 = learntHmm1.probability(testSequence1);
            System.out.println(seq1);
            double diff = seq - seq1;
            probdiff = diff / seq;
            System.out.println("diff::" + diff);
            System.out.println("prob diff::" + probdiff);
            // advance learning new sequences hh22
            testSequence2 = testSequence1; // this means new obs ses will be generated for calculating obd seq prob
            sequences1.clear();
            sequences1.add(testSequence2);
            System.out.println("Sequences: " + (sequences1));
            {
                System.out.println("Distance at iteration " + 1 + ": " + klc.distance(learntHmm1, hmm1));
                learntHmm1 = bwl.iterate(learntHmm1, sequences1);
            }
            //                System.out.println("do you want to continue");
            //                yourinput = user_input.next();
            //                if (yourinput.equals("8")) {
            //                    System.out.println("Resulting HMM:\n" + learntHmm);
            //                } else if (yourinput.equals("9")) {
            //                    System.out.println("Sequence 2: " + (testSequence1));
            //                }
            //            } while (!yourinput.equals("7"));
            /* Write the final result to a 'dot' (graphviz) file. */
            (new GenericHmmDrawerDot()).write(learntHmm1, "learntHmm.dot");

            
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(NewClass1.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(NewClass1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(NewClass1.class.getName()).log(Level.SEVERE, null, ex);
        }

        return probdiff;
        }


}
