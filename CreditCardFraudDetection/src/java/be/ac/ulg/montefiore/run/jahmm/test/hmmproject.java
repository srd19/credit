/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package src.be.ac.ulg.montefiore.run.jahmm.test;

/**
 *
 * @author chinmay patil
 */



import java.util.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;
import src.be.ac.ulg.montefiore.run.jahmm.*;
import src.be.ac.ulg.montefiore.run.jahmm.draw.GenericHmmDrawerDot;
import src.be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.KullbackLeiblerDistanceCalculator;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.MarkovGenerator;


/**
 * This class demonstrates how to build a HMM with known parameters, how to
 * generate a sequence of observations given a HMM, how to learn the parameters
 * of a HMM given observation sequences, how to compute the probability of an
 * observation sequence given a HMM and how to convert a HMM to a Postscript
 * drawing.
 */


public class hmmproject
{	
    static Scanner user_input = new Scanner( System.in );
	/* Possible packet reception status */
	
    
    // This are three observations of our states.
	public enum Packet {
		Low, Med,High;
		
		public ObservationDiscrete<Packet> observation() {
			return new ObservationDiscrete<Packet>(this);
		}
	}; 
	
	
	public static void main(String[] argv) 
	throws java.io.IOException
	{	
		/* Build a HMM and generate observation sequences using this HMM */
		
		Hmm<ObservationDiscrete<Packet>> hmm = buildHmm();
		
		List<List<ObservationDiscrete<Packet>>> sequences;
		sequences = generateSequences(hmm);
		
		/* Baum-Welch learning */
		
		BaumWelchLearner bwl = new BaumWelchLearner();
		
		Hmm<ObservationDiscrete<Packet>> learntHmm = buildInitHmm();
		
		// This object measures the distance between two HMMs
		KullbackLeiblerDistanceCalculator klc = 
			new KullbackLeiblerDistanceCalculator();
		
		// Incrementally improve the solution
		for (int i = 0; i < 100; i++) {
			System.out.println("Distance at iteration " + i + ": " +
					klc.distance(learntHmm, hmm));
			learntHmm = bwl.iterate(learntHmm, sequences);
		}
		
		System.out.println("Resulting HMM:\n" + learntHmm);
		
		/* Computing the probability of a sequence */
		
		ObservationDiscrete<Packet> packetLow = Packet.Low.observation();
		ObservationDiscrete<Packet> packetMed = Packet.Med.observation();
		ObservationDiscrete<Packet> packetHigh = Packet.High.observation();
                
		List<ObservationDiscrete<Packet>> testSequence = 
			new ArrayList<ObservationDiscrete<Packet>>(); 
		testSequence.add(packetLow);
		testSequence.add(packetMed);
		testSequence.add(packetHigh);
                testSequence.add(packetLow);
		testSequence.add(packetLow);
		testSequence.add(packetMed);
                testSequence.add(packetLow);
		testSequence.add(packetHigh);
		testSequence.add(packetLow);
                testSequence.add(packetHigh);
		testSequence.add(packetMed);
		testSequence.add(packetMed);
                testSequence.add(packetLow);
		testSequence.add(packetLow);
		testSequence.add(packetHigh);
                
                
                //declaration only one time
                List<ObservationDiscrete<Packet>> testSequence1 = 
			new ArrayList<ObservationDiscrete<Packet>>();
                List<List<ObservationDiscrete<Packet>>> sequences1 =
                        new ArrayList<List<ObservationDiscrete<Packet>>>();
                String yes ="1";
                String no ="2";
                String yourinput;
                
                
                
		do{
                    //seq prob 1
//		System.out.println("Sequence probability1: " +
//				learntHmm.probability(testSequence));
//                System.out.println("Sequence 1: " + (testSequence));
                
                //add 15 element in test seq 2
                testSequence1=sequser(testSequence);
		
		
                //seq prob 2
                
//		System.out.println("Sequence probability2: " +
//				learntHmm.probability(testSequence1));
 //               System.out.println("Sequence 2: " + (testSequence1));
                
                
               //calculate fraud or not
                double seq=learntHmm.probability(testSequence);
                    System.out.println(seq);
                double seq1=learntHmm.probability(testSequence1);
                    System.out.println(seq1);
                double diff=seq-seq1;
                double probdiff=diff/seq;
                System.out.println("diff::"+diff);
                System.out.println("prob diff::"+probdiff);
               
              testSequence=testSequence1;
              sequences1.clear();
              sequences1.add(testSequence);
              
              
//              System.out.println("Sequences: " +(sequences1));
 //               {
//			System.out.println("Distance at iteration " + 8 + ": " +
//					klc.distance(learntHmm, hmm));
//			learntHmm = bwl.iterate(learntHmm,sequences1 );
//		}
		
		
                
                System.out.println("do you want to continue");
                
                yourinput = user_input.next( );
                if(yourinput.equals("8"))
                {
                    System.out.println("Resulting HMM:\n" + learntHmm);
                }
                else if(yourinput.equals("9"))
                {
                    System.out.println("Sequence 2: " + (testSequence1));
                }
                } while(! yourinput.equals("7"));
             
                
		/* Write the final result to a 'dot' (graphviz) file. */
		
		(new GenericHmmDrawerDot()).write(learntHmm, "learntHmm.dot");
	}
	
	
	/* The HMM this initializing hmm */
	
	static Hmm<ObservationDiscrete<Packet>> buildHmm()
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
	
	static Hmm<ObservationDiscrete<Packet>> buildInitHmm()
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
				new double[] { 0.40, 0.30,0.30 }));
		hmm.setOpdf(1, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.40,0.30}));
		hmm.setOpdf(2, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.30,0.40 }));
		hmm.setOpdf(3, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.30,0.40 }));
                hmm.setOpdf(4, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.40,0.30 }));
                hmm.setOpdf(5, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.40,0.30 }));
                hmm.setOpdf(6, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.40, 0.30,0.30 }));
                hmm.setOpdf(7, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.30,0.40 }));
                hmm.setOpdf(8, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.40, 0.30,0.30 }));
                hmm.setOpdf(9, new OpdfDiscrete<Packet>(Packet.class,
				new double[] { 0.30, 0.30,0.40 }));
		
		
		return hmm;
	}
	
	
	/* Generate several observation sequences using a HMM */
	
	static <O extends Observation> List<List<O>> 
	generateSequences(Hmm<O> hmm)
	{
		MarkovGenerator<O> mg = new MarkovGenerator<O>(hmm);
		
		List<List<O>> sequences = new ArrayList<List<O>>();
		for (int i = 0; i < 40; i++)
			sequences.add(mg.observationSequence(15));
                System.out.println("Sequences: " +(sequences));
		return sequences;
	}
        
        
        
        static List<ObservationDiscrete<Packet>> 
        sequser(List<ObservationDiscrete<Packet>> sequence)
        {
             List<ObservationDiscrete<Packet>> testSequence = new ArrayList<ObservationDiscrete<Packet>>();
             testSequence=sequence;
             
            List<ObservationDiscrete<Packet>> testSequence1 = new ArrayList<ObservationDiscrete<Packet>>(); 
         String yourinput;
        ObservationDiscrete<Packet> packetLow = Packet.Low.observation();
	ObservationDiscrete<Packet> packetMed = Packet.Med.observation();
        ObservationDiscrete<Packet> packetHigh = Packet.High.observation();
            String Low ="1";
            String Med ="2";
            String High ="3";
           
            for(int i=1;i<15;i++)//purposely started it from 1
               testSequence1.add(testSequence.get(i));
             
            do {
            System.out.println("please enter your input");
            yourinput = user_input.next( );
            
            if (yourinput.equals(Low)) 
            testSequence1.add(packetLow);
            else if (yourinput.equals(Med))
             testSequence1.add(packetMed);
            else if(yourinput.equals(High))
                testSequence1.add(packetHigh);
            }while( yourinput.equals("4"));
//            while(! yourinput.equals("4"));
            return testSequence1;
        }
           
        
}
