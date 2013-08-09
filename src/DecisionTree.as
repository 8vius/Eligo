package
{
	public class DecisionTree
	{
		public static const A_OPTION : String = "a";
		public static const B_OPTION : String = "b";
		public static const NO_OPTION : String = "no";
		
		private var members : Array;
		
		public function DecisionTree()
		{
			members = [];
		}
		
		public function add(aOption:Object, bOption:Object, noOption:Object) : void {
			members.push({a: aOption, b:bOption, no:noOption});
		}
		
		public function get(i:Number) : Object {
			return members[i];
		}
	}
}