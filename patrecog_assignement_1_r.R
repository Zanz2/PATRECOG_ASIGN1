#patrecog assignement in R

if (FALSE){
  "The data file mnist.csv contains gray-scale images of hand-drawn digits, from zero through nine.

Each image is 28 pixels in height and 28 pixels in width, for a total of 784 pixels in total. Each pixel has a single pixel-value associated with it, 
indicating the lightness or darkness of that pixel, with higher numbers meaning darker. This pixel-value is an integer between 0 and 255, inclusive.

The data set has 785 columns. The first column, called \"label\", is the digit that was written by the user. 
The rest of the columns contain the pixel-values of the associated image.

Each pixel column in the data set has a name like pixelx, where x is an integer between 0 and 783, inclusive. 
To locate this pixel on the image, suppose that we have decomposed x as x = i * 28 + j, where i and j are integers between 0 and 27, inclusive. 
Then pixelx is located on row i and column j of a 28 x 28 matrix, (indexing by zero).

For example, pixel31 indicates the pixel that is in the fourth column from the left, and the second row from the top, as in the ascii-diagram below.

Visually, if we omit the \"pixel\" prefix, the pixels make up the image like this:

000 001 002 003 ... 026 027
028 029 030 031 ... 054 055
056 057 058 059 ... 082 083
 |   |   |   |  ...  |   |
728 729 730 731 ... 754 755
756 757 758 759 ... 782 783 "  
}


library("OpenImageR")
library("Hmisc")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
mnist.dat = read.csv("mnist.csv")
mnist_original = read.csv("mnist.csv")
dim(mnist.dat)

imageShow(matrix(as.numeric(mnist.dat[380,-1]),nrow=28,ncol=28,byrow=T))

summary(mnist.dat)

mnist.dat[,1] <- as.factor(mnist.dat[,1]) # get all values from the first column (the number on the image)
y <- mnist.dat[,1] # this is just a vector of the classes now
rev(sort(table(y))) # reverses a sorted table of how many times each class (factor) occurs
number_of_entries <- dim(mnist.dat)[1] #first dimension of the dataset is the number of rows


majority_class = rev(sort(table(y)))[1]
correct_pred <- mnist.dat[mnist.dat[,1] == "1",]
correct_pred <- dim(correct_pred)[1]
accuracy = correct_pred / number_of_entries
accuracy # percentage of casses classified correctly if we assume the majority class
#describe(mnist.dat)
