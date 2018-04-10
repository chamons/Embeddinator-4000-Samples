using System;
namespace SimpleLib
{
	public class Adder
	{
		public int X { get; }
		public int Y { get; }
		
		public Adder (int x, int y)
		{
			X = x;
			Y = y;
		}

		public int Value () => X + Y;
	}
}
