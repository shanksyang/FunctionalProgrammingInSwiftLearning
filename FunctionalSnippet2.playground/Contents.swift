
import Foundation

func getContents(url: String) -> String {
    NSURL(string: <#String#>)
    return NSString(contentsOfURL: NSURL(string: url)!, encoding: NSUTF8StringEncoding, error: nil)! as String

}

func lines(input: String) -> [String] {
    return input.componentsSeparatedByCharactersInSet(
        NSCharacterSet.newlineCharacterSet())
}

let linesInURL = { url in count(lines(getContents(url))) }
linesInURL("http://codebuild.me")

infix operator >>> { associativity left }
func >>> <A, B, C>(f: B -> C, g: A -> B) -> A -> C {
    return { x in f(g(x)) }
}

let linesInURL2 = count >>> lines >>> getContents
linesInURL2("http://codebuild.me")


//it doesn't matter whether the associativity is left or right, both are correct..
//i think '<<<' should be easily understood over '>>>'.., My reason is, excuting the methods should begin from right to left，function getContents excuted firstly, "lines" seconedly, the end is "count"
infix operator <<< { associativity left }
func <<< <A, B, C>(f: B -> C, g: A -> B) -> A -> C {
    return { x in f(g(x)) }
}

let linesInURL3 = (count <<< lines) <<< getContents

linesInURL3("http://codebuild.me")

