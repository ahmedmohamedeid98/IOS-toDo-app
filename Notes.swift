/*
 
 
 +(void)animateWithDuration:(NSTimeInterval)duration
    delay:(NSTimeInterval)delay
    options:(UIViewAnimationOptions)options
    animations:(void (^)(void))animations
    completion:(void (^)(BOOL finished))completion;

 
//////////////Parameters
(duration)
The total duration of the animations, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
 
(delay)
The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.

(options)
A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIViewAnimationOptions.

(animations)
A block object containing the changes to commit to the views. This is where you programmatically change any animatable properties of the views in your view hierarchy. This block takes no parameters and has no return value. This parameter must not be NULL.

 
(completion)
A block object to be executed when the animation sequence ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL

 */
