/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package be.ac.ulg.montefiore.run.jahmm.test;


import java.util.*;

import src.be.ac.ulg.montefiore.run.jahmm.*;
import src.be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.KullbackLeiblerDistanceCalculator;
import src.be.ac.ulg.montefiore.run.jahmm.toolbox.MarkovGenerator;
/**
 *
 * @author chinmay
 */
public class MyClass {
    public static void main(String[] args) {
        
OpdfIntegerFactory factory = new OpdfIntegerFactory(3);//here 3 states observations can have 3 values
Hmm<ObservationInteger> hmm = new Hmm<ObservationInteger>(10, factory);

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


hmm.setOpdf (0, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (1, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (2, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (3, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (4, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (5, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (6, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (7, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (8, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));
hmm.setOpdf (9, new OpdfInteger (new double [] {0.33 , 0.33,0.33}));


//Now, let's build 200 observation sequences (of length 100) based on this HMM

List<List<ObservationInteger>> sequences;
		sequences = generateSequences(hmm);


         /* Baum-Welch learning */
		
		BaumWelchLearner bwl = new BaumWelchLearner();
		
		Hmm<ObservationInteger> learntHmm = buildInitHmm();
		
		// This object measures the distance between two HMMs
		KullbackLeiblerDistanceCalculator klc = 
			new KullbackLeiblerDistanceCalculator();
		
		// Incrementally improve the solution
		for (int i = 0; i < 10; i++) {
			System.out.println("Distance at iteration " + i + ": " +
					klc.distance(learntHmm, hmm));
			learntHmm = bwl.iterate(learntHmm, sequences);
		}
		
		System.out.println("Resulting HMM:\n" + learntHmm);
		
		/* Computing the probability of a sequence */
		
		
		
		
		
		
	

/**
 *
 creates a HMM with 5 states and observation distributions that handles integers ranging
from 0 to 9 (included). The state transition functions and initial probabilities are
uniformly distributed. The distribution associated with each state is given by the result
of the factor() method applied to the factory object (in this case, it returns a uniform
distribution between 0 and 9).
 */ 
        
     
    }
    static Hmm<ObservationInteger> buildInitHmm()
	{	
		OpdfIntegerFactory factory = new OpdfIntegerFactory(3);//here 3 states observations can have 3 values
Hmm<ObservationInteger> hmm = new Hmm<ObservationInteger>(10, factory);
		
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


hmm.setOpdf (0, new OpdfInteger (new double [] {0.25 , 0.50,0.25}));
hmm.setOpdf (1, new OpdfInteger (new double [] {0.20 , 0.50,0.30}));
hmm.setOpdf (2, new OpdfInteger (new double [] {0.50 , 0.25,0.25}));
hmm.setOpdf (3, new OpdfInteger (new double [] {0.25 , 0.50,0.25}));
hmm.setOpdf (4, new OpdfInteger (new double [] {0.25 , 0.50,0.25}));
hmm.setOpdf (5, new OpdfInteger (new double [] {0.25 , 0.50,0.25}));
hmm.setOpdf (6, new OpdfInteger (new double [] {0.50 , 0.25,0.25}));
hmm.setOpdf (7, new OpdfInteger (new double [] {0.25 , 0.25,0.50}));
hmm.setOpdf (8, new OpdfInteger (new double [] {0.25 , 0.25,0.50}));
hmm.setOpdf (9, new OpdfInteger (new double [] {0.50 , 0.25,0.25}));
		
		return hmm;
	}
     static <O extends Observation> List<List<O>> 
	generateSequences(Hmm<O> hmm)
	{
		MarkovGenerator<O> mg = new MarkovGenerator<O>(hmm);
		
		List<List<O>> sequences = new ArrayList<List<O>>();
		for (int i = 0; i < 100; i++)
			sequences.add(mg.observationSequence(100));

		return sequences;
	}      
}
