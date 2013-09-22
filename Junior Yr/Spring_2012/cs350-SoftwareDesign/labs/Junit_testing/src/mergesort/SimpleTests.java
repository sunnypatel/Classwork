package mergesort;

import static org.junit.Assert.*;

import org.junit.* ;

public class SimpleTests {
	
	@Test
	public void testInOrder()
	{
	     Integer [] TestArray = new Integer[] {3,2,4};
	     Integer [] CorrectArray = new Integer[] {2,3,4};
	     MergeSort.mergeSort(TestArray);
	     assertTrue(CompareArrays(TestArray, CorrectArray));
	 
	 }
	@Test
	public void testNotOrder()
	{
	     Integer [] TestArray = new Integer[] {1,2,3,4,5};
	     Integer [] CorrectArray = new Integer[] {1,3,2,4,5};
	     MergeSort.mergeSort(TestArray);
	     assertTrue(!CompareArrays(TestArray, CorrectArray));
	}
	@Test
	public void lengthTest(){
		Integer [] TestArray = new Integer[] {1,2,3,4,5};
		MergeSort.mergeSort(TestArray);
		assertTrue(sizeTest(TestArray.length,5));
		
		
		Integer [] TestArray2 = new Integer[] {2,3,4,5};
		MergeSort.mergeSort(TestArray2);
		assertTrue(sizeTest(TestArray2.length,4));
	}
	
	private boolean sizeTest(int i, int j){
		return (i==j) ? true : false;
	}
	
	private boolean CompareArrays(Integer[] testArray, Integer[] correctArray) {
		for(int i=0; i< testArray.length; i++){
			if(testArray[i] != correctArray[i])
				return false;
		}
		return true;
	}
}
