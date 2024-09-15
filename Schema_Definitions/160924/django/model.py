from django.db import models

class CustomGPT(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    link = models.URLField()
    description = models.TextField()
    config = models.JSONField()
    creation_date = models.DateTimeField(auto_now_add=True)
    prompt_outputs = models.ManyToManyField('PromptOutput', related_name='custom_gpts')
    activity_status = models.ForeignKey('LookupActivityStatus', on_delete=models.SET_NULL, null=True, related_name='custom_gpts')
    agent_groups = models.ManyToManyField('LookupAgentGroups', related_name='custom_gpts')
    gpt_model = models.ForeignKey('LookupGptModels', on_delete=models.SET_NULL, null=True, related_name='custom_gpts')
    output_reviews_done = models.ManyToManyField('LookupGptOutputReviewsDone', related_name='custom_gpts')
    gpt_rating = models.ForeignKey('LookupGptRating', on_delete=models.SET_NULL, null=True, related_name='custom_gpts')
    response_time = models.ForeignKey('LookupGptResponseTimes', on_delete=models.SET_NULL, null=True, related_name='custom_gpts')
    gpt_cats = models.ManyToManyField('LookupGptCats', related_name='custom_gpts')
    llm_list = models.ForeignKey('LookupLlmList', on_delete=models.SET_NULL, null=True, related_name='custom_gpts')
    project_tags = models.ManyToManyField('LookupProjectTags', related_name='custom_gpts')

    def __str__(self):
        return self.name

class PromptLibrary(models.Model):
    id = models.AutoField(primary_key=True)
    prompt_name = models.CharField(max_length=100)
    prompt_text = models.TextField()
    prompt_dev_stage = models.ForeignKey('LookupPromptDevStages', on_delete=models.SET_NULL, null=True, related_name='prompt_libraries')
    project_tags = models.ManyToManyField('LookupProjectTags', related_name='prompt_libraries')

    def __str__(self):
        return self.prompt_name

class OutputTag(models.Model):
    id = models.AutoField(primary_key=True)
    tag_name = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.tag_name

class LookupAccuracyLevel(models.Model):
    id = models.AutoField(primary_key=True)
    level = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.level

class LookupActionabilityLevel(models.Model):
    id = models.AutoField(primary_key=True)
    level_name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.level_name

class LookupActivityStatus(models.Model):
    id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.status_name

class LookupAgentGroups(models.Model):
    id = models.AutoField(primary_key=True)
    group_name = models.CharField(max_length=100)
    group_description = models.TextField()

    def __str__(self):
        return self.group_name

class LookupGptModels(models.Model):
    id = models.AutoField(primary_key=True)
    model_name = models.CharField(max_length=100)
    model_description = models.TextField()

    def __str__(self):
        return self.model_name

class LookupGptOutputReviewsDone(models.Model):
    id = models.AutoField(primary_key=True)
    review_name = models.CharField(max_length=100)
    review_desc = models.TextField()

    def __str__(self):
        return self.review_name

class LookupGptRating(models.Model):
    id = models.AutoField(primary_key=True)
    rating = models.IntegerField()
    rating_description = models.TextField()

    def __str__(self):
        return str(self.rating)

class LookupGptResponseTimes(models.Model):
    id = models.AutoField(primary_key=True)
    response_time = models.CharField(max_length=100)
    min_value = models.IntegerField()
    max_value = models.IntegerField()
    description = models.TextField()

    def __str__(self):
        return self.response_time

class LookupGptCats(models.Model):
    id = models.AutoField(primary_key=True)
    cat_name = models.CharField(max_length=100)
    cat_desc = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.cat_name

class LookupKnowledgeTypes(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class LookupLlmList(models.Model):
    id = models.AutoField(primary_key=True)
    llm_name = models.CharField(max_length=100)
    llm_desc = models.TextField()
    year_released = models.IntegerField()

    def __str__(self):
        return self.llm_name

class LookupMdConversionStatus(models.Model):
    id = models.AutoField(primary_key=True)
    status_name = models.CharField(max_length=100)

    def __str__(self):
        return self.status_name

class LookupMediaTypes(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.name

class LookupProjectTags(models.Model):
    id = models.AutoField(primary_key=True)
    tag_name = models.CharField(max_length=100)
    tag_desc = models.TextField()

    def __str__(self):
        return self.tag_name

class LookupPromptDevStages(models.Model):
    id = models.AutoField(primary_key=True)
    stage_name = models.CharField(max_length=100)
    stage_desc = models.TextField()

    def __str__(self):
        return self.stage_name

class PromptOutput(models.Model):
    id = models.AutoField(primary_key=True)
    date = models.DateTimeField(auto_now_add=True)
    summary = models.TextField()
    full_output = models.TextField()
    notes = models.TextField()
    prompt = models.ForeignKey(PromptLibrary, on_delete=models.CASCADE, related_name='prompt_outputs')
    tags = models.ManyToManyField(OutputTag, related_name='prompt_outputs')
    accuracy_level = models.ForeignKey(LookupAccuracyLevel, on_delete=models.SET_NULL, null=True, related_name='prompt_outputs')
    actionability_level = models.ForeignKey(LookupActionabilityLevel, on_delete=models.SET_NULL, null=True, related_name='prompt_outputs')
    knowledge_types = models.ManyToManyField(LookupKnowledgeTypes, related_name='prompt_outputs')
    llm_list = models.ForeignKey(LookupLlmList, on_delete=models.SET_NULL, null=True, related_name='prompt_outputs')
    md_conversion_status = models.ForeignKey(LookupMdConversionStatus, on_delete=models.SET_NULL, null=True, related_name='prompt_outputs')
    media_types = models.ManyToManyField(LookupMediaTypes, related_name='prompt_outputs')
    project_tags = models.ManyToManyField(LookupProjectTags, related_name='prompt_outputs')

    def __str__(self):
        return self.summary

class AccessUI(models.Model):
    id = models.AutoField(primary_key=True)
    ui_name = models.CharField(max_length=100)
    custom_gpt = models.ForeignKey(CustomGPT, on_delete=models.CASCADE, related_name='access_uis')

    def __str__(self):
        return self.ui_name