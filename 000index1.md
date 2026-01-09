# Switch to main
git checkout main

# Pull latest (includes the merged PR)
git pull origin main

# If you're on a feature branch and want to rebase/update it with latest main
git checkout your-feature-branch
git rebase main
# or
git merge main