mod two_sum;

fn main() {
    let nums = vec![2, 7, 11, 15];
    let target = 17;
    match two_sum::Solution::two_sum(nums, target).as_slice() {
        [i, j] => println!("Found indices: {} {}", i, j),
        _ => println!("No pair found"),
    }
}
