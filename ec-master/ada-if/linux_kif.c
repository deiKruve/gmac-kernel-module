

#include  <linux/mutex.h>

DEFINE_MUTEX(mname1);
mutex_init(mname1);
DEFINE_MUTEX(mname2);
mutex_init(mname2);
//  .
//  .
//  .
// to be constructed with awk
// so now there are 'n' mutexes available with names "mname1" ..... "mname<n>"
// and in ada we can use them by saying
// extern mname1 : linux_mutex.mutex with Import => True, Convention => C;


destroy_mutex (struct mutex *lock)
{
  mutex_destroy(lock);
}

// mutex_is_locked - is the mutex locked
// Returns 1 if the mutex is locked, 0 if unlocked.
int is_mutex_locked(struct mutex *lock)
{
  return mutex_is_locked(lock);
}


/* void mutex_lock (struct mutex *lock) */
/* { */
/*   mutex_lock_nested(lock, 0); */
/* } */

/* void mutex_lock_interruptible (struct mutex *lock) */
/* { */
/*   mutex_lock_interruptible_nested(lock, 0); */
/* } */

/* void mutex_lock_killable (struct mutex *lock) */
/* { */
/*   mutex_lock_killable_nested(lock, 0); */
/* } */

