package dal;

/**
 *
 * @author chinmay
 */
import java.io.*;
import java.util.*;

public class KMean
{
	Vector c[];
	int nc,ne,size[];
	float m[],diff[];
	int el[];
        int el1[];
        public Float mean1=0f;
       public  Float mean2=0f;
       public Float mean3=0f;
       public Float meanlow=0f;
       public  Float meanmedium=0f;
       public Float meanhigh=0f;
       public ArrayList<Integer> clusterlow=new ArrayList<Integer>();
       public  ArrayList<Integer> clustermedium=new ArrayList<Integer>();
        public  ArrayList<Integer> clusterhigh=new ArrayList<Integer>();

        //here t stands for element and 1,2,3 stands for mean 1,mean 2 mean3
             float difft1=0;
             float difft2=0;
             float difft3=0;
             float diff1t=0;
             float diff2t=0;
             float diff3t=0;

	Scanner sc=new Scanner(System.in);
	public void input(int noofcluster,int noofelements,int[] elements)
	{
		System.out.print("Enter Number Of Clusters ");
		nc=noofcluster;
		c=new Vector[nc];
		size=new int[nc];
		m=new float[nc];
		diff=new float[nc];
		System.out.print("Enter Number Of Elements ");
		ne=noofelements;
		el=new int[ne];
                el1=new int[ne];
		System.out.println("Enter "+ne+" Elements");
		for(int i=0;i<ne;i++)
                {
			el[i]=elements[i];
                        el1[i]=elements[i];
                }
                Arrays.sort(el1);
	}
	public void separate()
	{
                

		int sum=0,min,flag;

                //enter first three values in mean1 and mean2 mean 3
		for(int i=0;i<nc;i++)
			m[i]=el[i];
                //create cluster 1 and 2 and 3 for our program
		for(int i=0;i<(nc);i++)
		{
			c[i]=new Vector();

		}

                //add value 1 to value 5  in cluster 1
                for(int i=0;i<5;i++)
		{
                        c[0].add(el1[i]);

		}
                 //add value 5 to 10 in cluster 1
                for(int i=5;i<10;i++)
		{
                        c[1].add(el1[i]);

		}

                //add remaning values in cluster 3

		for(int i=10;i<ne;i++)
		c[2].add(el1[i]);

 int countterminate=0;
		while(true)
		{       countterminate++;
			flag=0;
			for(int k=0;k<nc;k++)
			{

				size[k]=c[k].size();
				sum=0;
				for(int j=0;j<c[k].size();j++)
					sum+=Integer.parseInt(""+c[k].get(j));
				m[k]=((float)sum/c[k].size());
			}
			for(int k=0;k<nc;k++)
			{
				System.out.println("Mean Of Cluster"+(k+1)+" = "+m[k]);
				System.out.println("Cluster "+(k+1)+" Is As Follows:-");
				for(int j=0;j<c[k].size();j++)
					System.out.println(""+c[k].get(j));

			}
			//min=0;
			c=new Vector[nc];
			for(int k=0;k<nc;k++)
			{
				c[k]=new Vector();
			}
		//	for(int i=0;i<ne;i++)
		//	{
		//		for(int j=0;j<nc;j++)
		//		{
		//			if(m[j]>el[i])
		//				diff[j]=m[j]-el[i];
		//			else
		//				diff[j]=el[i]-m[j];
		//			if(diff[j]<diff[min])
		//				min=j;
		//		}
		//		c[min].add(el[i]);
		//	}


                        //this will happen 15 times to map the 15 elements clusters
for(int i=0;i<15;i++)
                        {
                    difft1=el[i]-m[0];
                    difft2=el[i]-m[1];
                    difft3=el[i]-m[2];
                    diff1t=m[0]-el[i];
                    diff2t=m[1]-el[i];
                    diff3t=m[2]-el[i];
                    
                     if(difft1<=0)//&& diff1<diff2)
                    {
                         c[0].add(el[i]);
                    }
                    else if(diff3t<=0){
                        c[2].add(el[i]);
                        }
                    else if(diff2t>=0) //&& diff2<diff3)
                    {
                        if(difft1<diff2t)
                        c[0].add(el[i]);
                        else
                        c[1].add(el[i]);
                    }
                    else if(diff2t<0)
                    {
                        if(difft2<diff3t)
                        c[1].add(el[i]);
                        else
                        c[2].add(el[i]);
                    }

                        }

			for(int k=0;k<nc;k++)
			{
				if(size[k]!=c[k].size())
					flag=1;
			}
			if(flag==0||countterminate==30)
				break;
		}

         mean1=m[0];
         mean2=m[1];
         mean3=m[2];
//                System.out.println("Mean Low : "+m[0]);
//                System.out.println("Mean Medium : "+m[1]);
//                System.out.println("Mean High : "+m[2]);
//put the means in ascending order

         int count=0;
         int countmed=0;
         int countlow=0;

         if(mean1>mean2 && mean1>mean3)
         {
             meanhigh=mean1;count=0;
         }
         if(mean2>mean1 && mean2>mean3)
         {
             meanhigh=mean2;count=1;
         }
         if(mean3>mean1 && mean3>mean2)
         {
             meanhigh=mean3;count=2;
         }

         if(count==0)
         {
             if(mean2>mean3)
             {
                 meanmedium=mean2;
                 meanlow=mean3;
                 countmed=1;
                 countlow=2;
             }
             else
             {
                 meanmedium=mean3;
                 meanlow=mean2;
                 countmed=2;
                 countlow=1;
             }
         }
         if(count==1)
         {
             if(mean1>mean3)
             {
                 meanmedium=mean1;
                 meanlow=mean3;
                 countmed=0;
                 countlow=2;
             }
             else
             {
                 meanmedium=mean3;
                 meanlow=mean1;
                 countmed=2;
                 countlow=0;
             }
         }
         if(count==2)
         {
             if(mean1>mean2)
             {
                 meanmedium=mean1;
                 meanlow=mean2;
                 countmed=0;
                 countlow=1;
             }
             else
             {
                 meanmedium=mean2;
                 meanlow=mean1;
                 countmed=1;
                 countlow=0;
             }
         }


                System.out.println("Mean Low : "+meanlow);
                System.out.println("Mean Medium : "+meanmedium);
                System.out.println("Mean High : "+meanhigh);



                //save med value of cluster
                for(int i=0;i<c[countlow].size();i++){
                   clusterlow.add((Integer) c[countlow].get(i));
                     System.out.println("Cluster Low : "+c[countlow].get(i));
                }

            //save low value of cluster
                  for(int i=0;i<c[countmed].size();i++){
                    clustermedium.add((Integer) c[countmed].get(i));
                     System.out.println("Cluster Medium : "+c[countmed].get(i));
                }
                //save high value of cluster
                for(int i=0;i<c[count].size();i++){
                    clusterhigh.add((Integer) c[count].get(i));
                     System.out.println("Cluster High : "+c[count].get(i));
                }


	}
}



