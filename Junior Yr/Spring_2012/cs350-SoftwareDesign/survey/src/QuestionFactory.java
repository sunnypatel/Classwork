public class QuestionFactory {

	public QuestionFactory() {

	}

	public Question create(int index) {
		Question newQuestion = null;
		switch (index) {
		case 1: // True / False
			newQuestion = new TrueFalse();
			break;
		case 2:
			// Multiple Choice
			newQuestion = new MultipleChoice(1);
			break;
		case 3:// Short Answer
			newQuestion = new ShortAns();
			break;
		case 4: // Essay
			newQuestion = new Essay();
			break;
		case 5: // Ranking
			newQuestion = new Ranking();
			break;
		case 6: // Matching
			Matching matching = new Matching();
			matching.create(); // <----- TODO DONT LIKE THIS CHANGE IF TIME
			newQuestion = matching;
			break;
		}

		return newQuestion;
	}

}
