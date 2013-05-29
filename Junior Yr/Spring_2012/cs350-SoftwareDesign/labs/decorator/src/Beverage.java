
public class Beverage {
	private String description;
	private SizeFactor size;
	private Recipe recipe;
	
	public String getDesciption(){
		return this.description;
	}
	
	public int cost(){
		return this.size.cost();
	}
	
	public void setSizeFactor(SizeFactor size){
		this.size = size;
	}
	
	public void setRecipe(Recipe recipe){
		this.recipe = recipe;
	}
	
	public void prepare(){
		this.recipe.prepare();
	}
}
