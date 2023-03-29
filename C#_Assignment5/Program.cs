// Assignent 5 Priyan Rai
// LeetCode Solutions

// Question 1

public class Solution
{

    public int[] TwoSum(int[] nums, int target)
    {
        Dictionary<int, int> table = new Dictionary<int, int>();
        for (int i = 0; i < nums.Length; i++)
        {
            if (table.ContainsKey(target - nums[i]))
            {
                return new int[] { table[target - nums[i]], i };
            }
            if (!table.ContainsKey(nums[i]))
            {
                table.Add(nums[i], i);
            }

        }
        return null;
    }
}


// Question 9

public class Solution
{
    public bool IsPalindrome(int x)
    {
        var rev = x.ToString().Reverse();
        var y = string.Concat(rev);
        return x.ToString() == y;
    }
}


// Question 217

public class Solution
{
    public bool ContainsDuplicate(int[] nums)
    {
        Dictionary<int, int> dups = new();
        for (int i = 0; i < nums.Length; i++)
        {
            if (!dups.ContainsKey(nums[i]))
                dups.Add(nums[i], 1);
            else
                dups[nums[i]]++;
        }

        foreach (var v in dups)
        {
            if (v.Value > 1) return true;
        }

        return false;
    }
}


// Question 412
public class Solution
{
    public IList<string> FizzBuzz(int n)
    {
        List<string> output = new List<string>(n);
        for (int i = 1; i <= n; i++)
        {
            bool three = i % 3 == 0;
            bool five = i % 5 == 0;
            if (three && five)
                output.Add("FizzBuzz");
            else if (three)
                output.Add("Fizz");
            else if (five)
                output.Add("Buzz");
            else
                output.Add($"{i}");
        }

        return output;
    }
}